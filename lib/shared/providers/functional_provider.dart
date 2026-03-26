import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:troodking_app/env/theme/app_theme.dart';
import 'package:troodking_app/shared/widgets/alert_template.dart';

class FunctionalProvider extends ChangeNotifier {
  List<Widget> alerts = [];
  List<Widget> pages = [];
  
  String? currentPage;


  
  

  showAlert(
      {required GlobalKey key,
      required Widget content,
      bool closeAlert = false,
      bool animation = true,
      double padding = 20}) {
    final newAlert = Container(
        key: key,
        color: AppTheme.transparent,
        child: AlertTemplate(
            content: content,
            keyToClose: key,
            dismissAlert: closeAlert,
            animation: animation,
            padding: padding));
    if (alerts.isEmpty) {
      alerts.add(newAlert);
    }

    notifyListeners();
  }

  addPage({required GlobalKey key, required Widget content}) {
    currentPage = content.runtimeType.toString();
    log(currentPage!);
    pages.add(content);
    notifyListeners();
  }

  dismissAlert({required GlobalKey key}) {
    alerts.removeWhere((alert) => key == alert.key);
    notifyListeners();
  }

  dismissPage({required GlobalKey key}) {
    pages.removeWhere((page) => key == page.key);
    currentPage = '';
    notifyListeners();
  }


  
}