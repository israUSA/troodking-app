
import 'package:flutter/material.dart';
import 'package:troodking_app/404/page/404_page.dart';
import 'package:troodking_app/home/page/home_page.dart';


class AppRoutes{
  static const initialRoute = '/splash';

  static Map<String, Widget Function(BuildContext)> routes ={
    // '/splash' : (_) =>  const SplashScreen(),
    // '/login' : (_) =>  const LoginPage(),
    '/home' : (_) =>  const HomePage(),
  };

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => const Page404(),
    );
  }
}
