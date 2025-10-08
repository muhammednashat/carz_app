import 'package:carz_app/config/dependecy/dependeces.dart';
import 'package:carz_app/config/dependecy/reposotry_provider.dart';
import 'package:carz_app/data/models/user_model.dart';
import 'package:carz_app/ui/core/ui/custom_elevated_button.dart';
import 'package:carz_app/utils/constants.dart';
import 'package:carz_app/utils/detect_card_type.dart';
import 'package:carz_app/utils/util_funcs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddNewCardScreen extends ConsumerStatefulWidget {
  const AddNewCardScreen({super.key});

  @override
  ConsumerState<AddNewCardScreen> createState() => _AddNewCardScreenState();
}

class _AddNewCardScreenState extends ConsumerState<AddNewCardScreen> {
  CardType _cardType = CardType.unknown;
  String _cardIcon = getIconPath("unknown_card.png");
  final _controllers = List.generate(5, (index) {
    return TextEditingController();
  });

  final _focusList = List.generate(4, (index) {
    return FocusNode();
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add New Card')),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 32.0),
            Text("Card Number"),
            SizedBox(height: 4.0),
            TextFormField(
              controller: _controllers[0],
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                prefixIcon: Image.asset(
                  _cardIcon,
                  height: 10.0,
                  width: 10.0,
                  fit: BoxFit.contain,
                ),
              ),
              onChanged: (value) {
                _cardType = detectCardType(value);
                _updateCardIcon(_cardType);
                if (value.length == 2) {
                  FocusScope.of(context).requestFocus(_focusList[0]);
                }
              },
            ),
            SizedBox(height: 24.0),
            Text("Card Holder Name"),
            SizedBox(height: 4.0),
            TextFormField(
              controller: _controllers[1],
              focusNode: _focusList[0],
              decoration: InputDecoration(prefixIcon: Icon(Icons.person)),
            ),
            SizedBox(height: 24.0),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Expiry Month"),
                      TextFormField(
                        controller: _controllers[2],
                        focusNode: _focusList[1],

                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          if (value.length == 2) {
                            final month = int.tryParse(value);
                            if (month == null || month < 1 || month > 12) {
                              _controllers[2].clear();
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("Enter a valid month (01–12)"),
                                ),
                              );
                              return;
                            }

                            FocusScope.of(context).requestFocus(_focusList[2]);
                          }
                        },
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.date_range),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 8.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Expiry Year"),
                      TextFormField(
                        controller: _controllers[3],
                        focusNode: _focusList[2],
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          if (value.length == 2) {
                            final year = int.tryParse(value);
                            final currentYear = int.parse(
                              DateTime.now().year.toString().substring(2),
                            );

                            if (year == null || year < currentYear) {
                              _controllers[3].clear();
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("Enter a valid future year"),
                                ),
                              );
                              return;
                            }
                            FocusScope.of(context).requestFocus(_focusList[3]);
                          }
                        },
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.calendar_today),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 8.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("CVV"),
                      TextFormField(
                        controller: _controllers[4],
                        focusNode: _focusList[3],
                        onChanged: (value) {
                          if (value.length == 3)
                            FocusScope.of(context).unfocus();
                        },
                        keyboardType: TextInputType.number,

                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: 100.0),
            CustomElevatedButton(onPressed: _onPressed, text: 'Save'),
          ],
        ),
      ),
    );
  }

  _onPressed() async {
    print("iam here");
    final userBox = await ref.watch(userBoxProvider.future);
    final user = userBox.get(Constants.user) as UserModel;
    ref
        .watch(paymentMethodsRepoProvider)
        .addPaymentMethod(
          user.id,
          _controllers[0].text, //  4 digits
          _controllers[1].text, // name
          _controllers[2].text, // m
          _controllers[3].text, // y
          _cardType.name,
        );
  }

  void _updateCardIcon(CardType cardType) {
    _cardIcon = switch (cardType) {
      CardType.visa => getIconPath("visa_card.png"),
      CardType.mastercard => getIconPath("master_card.png"),
      CardType.amex => getIconPath("amex.png"),
      CardType.diners => getIconPath("diners.png"),
      CardType.discover => getIconPath("discover.png"),
      CardType.jcb => getIconPath("jcb.png"),
      CardType.unknown => getIconPath("unknown_card.png"),
    };

    setState(() {
      _cardIcon;
    });
  }
}
