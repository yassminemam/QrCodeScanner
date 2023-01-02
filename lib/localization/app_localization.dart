import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'l10n/messages_all.dart';

class AppLocalizations {
  static final _localization = AppLocalizations();

  static Future<AppLocalizations> load(Locale locale) {
    final String name =
        locale.languageCode.isEmpty ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(localeName).then((bool _) {
      Intl.defaultLocale = localeName;
      return AppLocalizations();
    });
  }

  static AppLocalizations getLocalization() {
    return _localization;
  }

  String get noPermission {
    return Intl.message("no Permission", name: 'noPermission');
  }
  String get noCodes {
    return Intl.message("There is no qr codes history.", name: 'noCodes');
  }
  String get codeType {
    return Intl.message("Barcode Type:", name: 'codeType');
  }
  String get data {
    return Intl.message("Data:", name: 'data');
  }
  String get loading {
    return Intl.message("Loading ...", name: 'loading');
  }
  String get codesList {
    return Intl.message("Codes List", name: 'codesList');
  }
  String get codeInfo {
    return Intl.message("Codes Info", name: 'codeInfo');
  }
}
