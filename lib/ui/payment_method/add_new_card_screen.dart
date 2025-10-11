import 'package:carz_app/config/dependecy/dependeces.dart';
import 'package:carz_app/config/dependecy/reposotry_provider.dart';
import 'package:carz_app/data/models/user_model.dart';
import 'package:carz_app/ui/core/ui/custom_elevated_button.dart';
import 'package:carz_app/ui/core/ui/loading_indecator.dart';
import 'package:carz_app/ui/payment_method/util.dart';
import 'package:carz_app/utils/constants.dart';
import 'package:carz_app/utils/detect_card_type.dart';
import 'package:carz_app/utils/util_funcs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class AddNewCardScreen extends ConsumerStatefulWidget {
  const AddNewCardScreen({super.key});

  @override
  ConsumerState<AddNewCardScreen> createState() => _AddNewCardScreenState();
}

class _AddNewCardScreenState extends ConsumerState<AddNewCardScreen> {
  final cardFormatter = MaskTextInputFormatter(mask: '#### #### #### ####');
  final _formKey = GlobalKey<FormState>();
  final _controllers = List.generate(5, (_) => TextEditingController());
  final _focusNodes = List.generate(4, (_) => FocusNode());

  bool _isLoading = false;
  CardType _cardType = CardType.unknown;
  String _cardIcon = getIconPath("unknown_card.png");

  @override
  void dispose() {
    for (final c in _controllers) {
      c.dispose();
    }
    for (final f in _focusNodes) {
      f.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add New Card')),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  _buildCardNumberField(),
                  const SizedBox(height: 24),
                  _buildHolderNameField(),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Expanded(child: _buildExpiryMonthField()),
                      const SizedBox(width: 8),
                      Expanded(child: _buildExpiryYearField()),
                      const SizedBox(width: 8),
                      Expanded(child: _buildCvvField()),
                    ],
                  ),
                  const SizedBox(height: 40),
                  CustomElevatedButton(onPressed: _onSavePressed, text: 'Save'),
                ],
              ),
            ),
          ),
          if (_isLoading) const LoadingIndicator(),
        ],
      ),
    );
  }

  Widget _buildCardNumberField() {
    return _LabeledField(
      label: 'Card Number',
      child: TextFormField(
        controller: _controllers[0],
        inputFormatters: [cardFormatter],
        keyboardType: TextInputType.number,
        validator: (v) => validatorCardNumber(v, _cardType),
        decoration: InputDecoration(
          prefixIcon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(_cardIcon, height: 20, width: 20),
          ),
          hintText: 'XXXX XXXX XXXX XXXX',
        ),
        onChanged: (value) {
          _cardType = detectCardType(value);
          _updateCardIcon(_cardType);
          if (value.length == 19) {
            FocusScope.of(context).requestFocus(_focusNodes[0]);
          }
        },
      ),
    );
  }

  Widget _buildHolderNameField() {
    return _LabeledField(
      label: 'Card Holder Name',
      child: TextFormField(
        controller: _controllers[1],
        focusNode: _focusNodes[0],
        validator: validatorHolderCardName,
        decoration: const InputDecoration(prefixIcon: Icon(Icons.person)),
      ),
    );
  }

  Widget _buildExpiryMonthField() {
    return _LabeledField(
      label: 'Expiry Month',
      child: TextFormField(
        controller: _controllers[2],
        focusNode: _focusNodes[1],
        keyboardType: TextInputType.number,
        validator: validatorExpiryMonth,
        decoration: const InputDecoration(prefixIcon: Icon(Icons.date_range)),
        onChanged: (value) {
          if (value.length == 2) {
            final month = int.tryParse(value);
            if (month == null || month < 1 || month > 12) {
              _controllers[2].clear();
              _showError('Enter a valid month (01–12)');
              return;
            }
            FocusScope.of(context).requestFocus(_focusNodes[2]);
          }
        },
      ),
    );
  }

  Widget _buildExpiryYearField() {
    return _LabeledField(
      label: 'Expiry Year',
      child: TextFormField(
        controller: _controllers[3],
        focusNode: _focusNodes[2],
        keyboardType: TextInputType.number,
        validator: validatorExpiryYear,
        decoration: const InputDecoration(prefixIcon: Icon(Icons.calendar_today)),
        onChanged: (value) {
          if (value.length == 2) {
            final year = int.tryParse(value);
            final currentYear =
                int.parse(DateTime.now().year.toString().substring(2));
            if (year == null || year < currentYear) {
              _controllers[3].clear();
              _showError('Enter a valid future year');
              return;
            }
            FocusScope.of(context).requestFocus(_focusNodes[3]);
          }
        },
      ),
    );
  }

  Widget _buildCvvField() {
    return _LabeledField(
      label: 'CVV',
      child: TextFormField(
        controller: _controllers[4],
        focusNode: _focusNodes[3],
        keyboardType: TextInputType.number,
        validator: validatorCVV,
        obscureText: true,
        decoration: const InputDecoration(prefixIcon: Icon(Icons.lock)),
        onChanged: (v) {
          if (v.length == 3) FocusScope.of(context).unfocus();
        },
      ),
    );
  }

  void _onSavePressed() {
    if (_formKey.currentState!.validate()) {
      _addNewCard();
    }
  }

  Future<void> _addNewCard() async {
    setState(() => _isLoading = true);
    try {
      final last4 = getLast4Figits(_controllers[0].text);
      final userBox = await ref.watch(userBoxProvider.future);
      final user = userBox.get(Constants.user) as UserModel;

      await ref.watch(paymentMethodsRepoProvider).addPaymentMethod(
            user.id,
            _controllers[1].text,
            last4,
            _controllers[2].text,
            _controllers[3].text,
            _cardType.name,
          );

      showToast('New card added');
      if (mounted) context.pop();
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  void _updateCardIcon(CardType cardType) {
    final map = {
      CardType.visa: 'visa_card.png',
      CardType.mastercard: 'master_card.png',
      CardType.amex: 'amex.png',
      CardType.diners: 'diners.png',
      CardType.discover: 'discover.png',
      CardType.jcb: 'jcb.png',
      CardType.unknown: 'unknown_card.png',
    };
    setState(() => _cardIcon = getIconPath(map[cardType]!));
  }

  void _showError(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }
}

class _LabeledField extends StatelessWidget {
  const _LabeledField({required this.label, required this.child});
  final String label;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: Theme.of(context)
                .textTheme
                .labelLarge
                ?.copyWith(fontWeight: FontWeight.w500)),
        const SizedBox(height: 4),
        child,
      ],
    );
  }
}
