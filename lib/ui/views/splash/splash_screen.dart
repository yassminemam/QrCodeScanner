import 'dart:async';
import 'package:flutter/material.dart';
import 'package:qr_scanner/ui/router.dart';
import 'package:qr_scanner/ui/theme/app_colors.dart';
import '../../../localization/app_localization.dart';
import '../../../r.dart';
import '../../theme/app_txt_syles.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
            () => Navigator.pushReplacementNamed(context, scannerRoute));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Stack(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Image.asset(R.assetsImgsSplashBg, fit: BoxFit.fitHeight),
                ),
                Container(
                  color: AppColors.color59bfff.withOpacity(0.8),
                ),
                Center(
                    child: Text(
                      AppLocalizations.getLocalization().loading,
                      style: AppTxtStyles.getAppMainTxtStyleWhiteColor(
                          size: 20, fontWeight: FontWeight.w600),
                    )),
              ],
            )));
  }
}