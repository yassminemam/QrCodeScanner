import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:qr_scanner/models/qr_code_model.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  void goToScannerScreen() {
    Navigator.pushReplacementNamed(context, 'scanner');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: Hive.box<QrCode>('codesbox').listenable(),
        builder: (context, Box<QrCode> box, _) {
          if (box.values.isEmpty) {
            return const Center(
                child: Text(
              'There is no qr codes history.',
            ));
          } else {
            return ListView.separated(
              itemCount: box.values.length,
              itemBuilder: (context, index) {
                var result = box.getAt(index);
                return Card(
                  child: ListTile(
                    title: Text(result!.type!),
                    subtitle: Text(result.data!),
                    trailing: Text(result.id),
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
