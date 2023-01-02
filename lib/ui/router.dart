import 'package:flutter/material.dart';
import 'package:qr_scanner/ui/views/code_info/code_info_screen.dart';
import 'package:qr_scanner/ui/views/history/history_screen.dart';
import 'package:qr_scanner/ui/views/scanner/scanner_screen.dart';
import 'package:qr_scanner/ui/views/splash/splash_screen.dart';

const String initialRoute = "splash";

const String historyRoute = "history";
const String scannerRoute = "scanner";
const String codeInfoRoute = "code_info";
const String splashRoute = "splash";
class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case historyRoute:
        return MaterialPageRoute(builder: (_) => const HistoryScreen());
      case scannerRoute:
        return MaterialPageRoute(builder: (_) => const ScannerScreen());
      case codeInfoRoute:
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