import 'package:flutter/widgets.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_scanner/models/qr_code_model.dart';
import '../main.dart';

class CodesProvider extends ChangeNotifier {
  Barcode? _newBarcode;
  QRViewController? _controller;

  QRViewController? get controller => _controller;

  set controller(QRViewController? value) {
    _controller = value;
  }

  Barcode? get newBarcode => _newBarcode;

  set newBarcode(Barcode? value) {
    _newBarcode = value;
    notifyListeners();
  }

  Future<void> addNewCodeToList() async {
    QrCode newCode = QrCode(
        id: DateTime.now().millisecond.toString(),
        type: newBarcode?.format.formatName,
        data: newBarcode?.code);
    await box!.put(DateTime.now().toString(), newCode);
  }
}
