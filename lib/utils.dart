import 'package:intl/intl.dart';
import 'package:decimal/decimal.dart';

String formatToReadable(dynamic number) =>
    NumberFormat.compact().format(number);

String processDecimal(Decimal dec) {
  final int decLength = dec.toString().split('.').last.length;
  final int intLength = dec.toString().split('.').first.length;
  if (dec.hasFinitePrecision) {
    if (intLength > 8) return formatToReadable(dec.toInt());
    if (decLength < 4)
      return dec.toString();
    else
      return dec.toStringAsFixed(4);
  }
  return dec.toStringAsFixed(4);
}

BigInt toBase(Decimal amount, [int decimals = 18]) {
  Decimal baseUnit = Decimal.fromInt(10).pow(decimals);
  Decimal inbase = amount * baseUnit;

  return BigInt.parse(inbase.toString());
}

Decimal toDecimal(BigInt amount, [int decimals = 18]) {
  Decimal baseUnit = Decimal.fromInt(10).pow(decimals);

  var d = Decimal.parse(amount.toString());
  d = d / baseUnit;

  return d;
}
