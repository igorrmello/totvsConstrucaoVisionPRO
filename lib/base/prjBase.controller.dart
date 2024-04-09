// ignore_for_file: depend_on_referenced_packages

import 'package:intl/intl.dart';

class BaseControl {
  late DateFormat _formatterDate = DateFormat('dd/MM/yyyy');
  final _formatterCurrencyPermutas =
      NumberFormat.currency(locale: "pt_Br", symbol: "N\$");
  final _numberFormat = NumberFormat.currency(locale: "pt_Br", symbol: "");
  final _formatterCurrencyReal =
      NumberFormat.currency(locale: "pt_Br", symbol: "R\$");
  final _numberFormatReal = NumberFormat.currency(locale: "pt_Br", symbol: "");
  void dispose() {}

  String? validarText(String nome) {
    if (nome.isEmpty) {
      return 'Campo obrigatório';
    }
    return null;
  }

  String dateFormat(String? dataFormat) {
    if (dataFormat != null && dataFormat.isNotEmpty) {
      return _formatterDate.format(DateFormat('yyyy-M-d').parse(dataFormat));
    } else {
      return "";
    }
  }

  String dateFormatstr(String? dataFormat, String format) {
    _formatterDate = DateFormat(format, 'pt_BR');
    if (dataFormat != null && dataFormat.isNotEmpty) {
      return _formatterDate.format(DateFormat('yyyy-M-d').parse(dataFormat));
    } else {
      return "";
    }
  }

  String valueFormat(dynamic valor, bool isCurrency) {
    if (isCurrency) return _formatterCurrencyPermutas.format(valor);
    return _numberFormat.format(valor);
  }

  String valueFormatReal(double valor, bool isCurrency) {
    if (isCurrency) return _formatterCurrencyReal.format(valor);
    return _numberFormatReal.format(valor);
  }
}
