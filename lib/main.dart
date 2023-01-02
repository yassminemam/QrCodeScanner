import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/models/qr_code_model.dart';
import 'package:qr_scanner/ui/router.dart';
import 'package:qr_scanner/ui/views/scanner/scanner_screen.dart';
import 'package:qr_scanner/ui/views/splash/splash_screen.dart';
import 'package:qr_scanner/utils.dart';
import 'package:qr_scanner/viewmodels/codes_provider.dart';
import 'package:hive_flutter/adapters.dart';

Box? box;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(QrCodeAdapter());
  box = await Hive.openBox<QrCode>(Utils.boxName);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CodesProvider()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
        initialRoute: initialRoute,
        onGenerateRoute: AppRouter.generateRoute,
      ),
    );
  }
}
