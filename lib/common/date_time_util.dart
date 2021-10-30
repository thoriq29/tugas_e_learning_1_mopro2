import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class DateTimeUtils {
  static Future initialize() async {
    await initializeDateFormatting(('id-ID'));
  }

  static String dateFormat(dynamic tanggal,
      {String format = 'dd MMMM yyyy', String locale = 'id'}) {
    String hasil = '';
    DateTime now = DateTime.now();
    if (tanggal is TimeOfDay) {
      var time = DateTime(now.year, now.month, now.day, tanggal.hour, tanggal.minute);
      hasil = DateFormat(format, locale).format(time).toString();
    }
    else if (tanggal is DateTime) {
      hasil = DateFormat(format, locale).format(tanggal).toString();
    }
    return hasil;
  }
}
