import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:qr_scanner/models/qr_code_model.dart';
import '../../../localization/app_localization.dart';
import '../../../utils.dart';
import '../../router.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  void goToScannerScreen() {
    Navigator.pushReplacementNamed(context, scannerRoute);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.getLocalization().codesList),
      ),
      body: ValueListenableBuilder(
        valueListenable: Hive.box<QrCode>(Utils.boxName).listenable(),
        builder: (context, Box<QrCode> box, _) {
          if (box.values.isEmpty) {
            return Center(
                child: Text(AppLocalizations.getLocalization().noCodes));
          } else {
            return ListView.separated(
              itemCount: box.values.length,
              itemBuilder: (context, index) {
                int codesCount = box.values.length;
                int orderedIndex = codesCount - index - 1;
                QrCode? result = box.getAt(orderedIndex);
                return Card(
                  child: ListTile(
                    title: Text(result!.type!),
                    subtitle: Text(result.data!),
                    trailing: Text("id: ${result.id}"),
                  ),
                );
              },
              separatorBuilder: (context, i) {
                return const SizedBox(height: 12);
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: goToScannerScreen,
        tooltip: 'Scan',
        child: const Icon(Icons.camera_alt_outlined),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
