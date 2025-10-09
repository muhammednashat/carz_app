import 'package:carz_app/utils/detect_card_type.dart';
import 'package:carz_app/utils/util_funcs.dart';

String? validatorCardNumber(String? value, CardType cardType) {
  if (value == null || value.isEmpty) {
    return "Card number is required";
  } else if (value.length < 19) {
    return "This number is not completed";
  } else if (cardType == CardType.unknown) {
    return "This card is not valid";
  }
  return null;
}

String? validatorHolderCardName(String? value) {
  if (value == null || value.isEmpty) {
    return "Card holder name is required";
  }
  return null;
}

String? validatorExpiryMonth(String? value) {
  if (value == null || value.isEmpty) {
    return "Expiry month is required";
  } else if (value.length < 2) {
    return "Enter a valid month";
  }
  return null;
}

String? validatorExpiryYear(String? value) {
  if (value == null || value.isEmpty) {
    return "Expiry year is required";
  } else if (value.length < 2) {
    return "Enter a valid month";
  }
  return null;
}

String? validatorCVV(String? value) {
  if (value == null || value.isEmpty) {
    return "CVV number is required";
  } else if (value.length < 3) {
    return "Enter a valid number";
  }
  return null;
}

String getCardIcon(String cardType) {
  print(cardType);
  return switch (cardType) {
    "VISA" => getIconPath("visa_card.png"),
    "MASTERCARD"  => getIconPath("master_card.png"),
    "AMEX" => getIconPath("amex.png"),
    "DINERS" => getIconPath("diners.png"),
    "DISCOVER" => getIconPath("discover.png"),
    "JCB" => getIconPath("jcb.png"),
    _ => getIconPath("unknown_card.png"),
  };
}
