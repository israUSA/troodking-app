import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:troodking_app/shared/helpers/global_helper.dart';
import 'package:troodking_app/shared/providers/functional_provider.dart';

Future<String?> scanService(BuildContext context) async {
  final fp = Provider.of<FunctionalProvider>(context, listen:false);

  try {
    ScanOptions options = const ScanOptions(
      strings: {'cancel': 'Cancelar'},
      android: AndroidOptions(
        aspectTolerance: 10,
        useAutoFocus: true,
      ),
    );

    var result = await BarcodeScanner.scan(options: options,);
    if (result.type == ResultType.Cancelled) {
      return null;
    }
    return result.rawContent;
  } catch (e) {
    final modelErrorScan = GlobalHelper.genKey();
    // fp.showAlert(key: modelErrorScan, content: AlertGeneric(content: ErrorGeneric(message: 'Ocurrió un error en abrir el escáner de QR.', keyToClose: modelErrorScan)));
  }
  return null;
}
