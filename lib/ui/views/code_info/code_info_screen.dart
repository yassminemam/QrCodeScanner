import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/ui/router.dart';
import '../../../localization/app_localization.dart';
import '../../../viewmodels/codes_provider.dart';

class CodeInfoScreen extends StatefulWidget {
  const CodeInfoScreen({super.key});

  @override
  State<CodeInfoScreen> createState() => _CodeInfoScreenState();
}

class _CodeInfoScreenState extends State<CodeInfoScreen> {
  late CodesProvider codesProvider;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    codesProvider = Provider.of<CodesProvider>(context, listen: false);
  }

  goToCodesHistoryScreen() async {
    codesProvider.addNewCodeToList().then((value) {
      Navigator.pushReplacementNamed(context, historyRoute);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.getLocalization().codeInfo),
      ),
      body: Center(
          child: Text(
        '${AppLocalizations.getLocalization().codeType} ${describeEnum(codesProvider.newBarcode!.format)} ${AppLocalizations.getLocalization().data} ${codesProvider.newBarcode!.code}',
        textAlign: TextAlign.center,
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: goToCodesHistoryScreen,
        tooltip: 'Done',
        child: const Icon(Icons.check),
      ),
    );
  }
}
