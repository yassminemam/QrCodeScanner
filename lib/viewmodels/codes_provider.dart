import 'package:flutter/widgets.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_scanner/models/qr_code_model.dart';

import '../main.dart';

class CodesProvider extends ChangeNotifier {
  List<QrCode> _codesList = [];
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

  List<QrCode> get codesList => _codesList;

  set codesList(List<QrCode> value) {
    _codesList = value;
    notifyListeners();
  }

  Future<void> addNewCodeToList() async {
    QrCode newCode = QrCode(
        id: DateTime.now().millisecond.toString(),
        type: newBarcode?.format.formatName,
        data: newBarcode?.code);
    _codesList.add(newCode);
    await box!.put(DateTime.now().toString(), newCode);
    codesList = _codesList;
  }
}
