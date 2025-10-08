
enum CardType { unknown, visa, mastercard, amex, discover, diners, jcb }

CardType detectCardType(String input) {
  final s = input.replaceAll(RegExp(r'\s+'), '');
  if (RegExp(r'^4[0-9]{0,}$').hasMatch(s)) return CardType.visa;
  if (RegExp(r'^(5[1-5][0-9]{0,}|2(2[2-9]|[3-6][0-9]|7[0-1]|720)[0-9]{0,})$').hasMatch(s)) return CardType.mastercard;
  if (RegExp(r'^(3[47][0-9]{0,})$').hasMatch(s)) return CardType.amex;
  if (RegExp(r'^(6(?:011|5|4[4-9])[0-9]{0,})$').hasMatch(s)) return CardType.discover;
  if (RegExp(r'^(3(?:0[0-5]|[68])[0-9]{0,})$').hasMatch(s)) return CardType.diners;
  if (RegExp(r'^(35[0-9]{0,})$').hasMatch(s)) return CardType.jcb;
  return CardType.unknown;
}

