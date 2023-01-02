import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_scanner/ui/router.dart';
import 'package:qr_scanner/viewmodels/codes_provider.dart';

import '../../../localization/app_localization.dart';

class ScannerScreen extends StatefulWidget {
  const ScannerScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  late CodesProvider codesProvider;

  void goToHistoryScreen() {
    Navigator.pushReplacementNamed(context, historyRoute);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    codesProvider = Provider.of<CodesProvider>(context, listen: false);
  }

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      codesProvider.controller!.pauseCamera();
    }
    codesProvider.controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildQrView(context),
      floatingActionButton: FloatingActionButton(
        onPressed: goToHistoryScreen,
        tooltip: 'listing',
        child: const Icon(Icons.list),
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Colors.red,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    controller.resumeCamera();
    codesProvider.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      codesProvider.newBarcode = scanData;
      controller.pauseCamera();
      Navigator.pushReplacementNamed(context, codeInfoRoute);
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(AppLocalizations.getLocalization().noPermission)),
      );
    }
  }

  @override
  void dispose() {
    codesProvider.controller?.dispose();
    super.dispose();
  }
}
