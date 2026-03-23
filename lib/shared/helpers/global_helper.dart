import 'package:flutter/material.dart';
import 'package:troodking_app/404/page/404_page.dart';
import 'package:troodking_app/shared/routes/routes.dart';

class GlobalHelper {

  static final GlobalHelper _instance = GlobalHelper._internal();
  factory GlobalHelper() => _instance;
  GlobalHelper._internal();



  static navigateToPageRemove(BuildContext context, String routeName) {
    final route = AppRoutes.routes[routeName];
    final page = (route != null) ? route.call(context) : const Page404();
    Navigator.pushAndRemoveUntil(
      context,
      PageRouteBuilder(
        fullscreenDialog: true,
        reverseTransitionDuration: const Duration(milliseconds: 100),
        transitionDuration: const Duration(milliseconds: 400),
        pageBuilder: (context, animation, _) => FadeTransition(
          opacity: animation,
          child: page,
        ),
      ),
      (route) => false,
    );
  }

  static Route navigationFadeIn(BuildContext context, Widget page) {
    return PageRouteBuilder(
      fullscreenDialog: true,
      reverseTransitionDuration: const Duration(milliseconds: 100),
      transitionDuration: const Duration(milliseconds: 100),
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: page,
        );
      },
    );
  }

  static GlobalKey genKey() {
    GlobalKey key = GlobalKey();
    return key;
  }

  static dismissKeyboard(BuildContext context) {
    FocusScope.of(context).unfocus();
  }



}
