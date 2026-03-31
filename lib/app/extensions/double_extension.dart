import 'package:intl/intl.dart';

extension CurrencyDouble on double {
  String get currency => NumberFormat.simpleCurrency(
    locale: 'pt_BR',
    // name: ConfigController.to.locale[1] != 'PY' ? null : 'PYG',
    // decimalDigits: 2,
  ).format(this);
}
