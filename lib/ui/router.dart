import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:qr_scanner/ui/views/code_info/code_info_screen.dart';
import 'package:qr_scanner/ui/views/history/history_screen.dart';
import 'package:qr_scanner/ui/views/scanner/scanner_screen.dart';

const String initialRoute = "history";

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case 'history':
        return MaterialPageRoute(builder: (_) => const HistoryScreen());
      case 'scanner':
        return MaterialPageRoute(builder: (_) => const ScannerScreen());
      case 'code_info':
        return MaterialPageRoute(builder: (_) => const CodeInfoScreen());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
              body: Center(
                child: Text('No route defined for ${settings.name}'),
              ),
            ));
    }
  }
}