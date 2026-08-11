import 'package:flutter/material.dart';

class LoginPageController {

  bool showPassword = true;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool loginFormIsNotEmpty() {
    return emailController.text.trim().isNotEmpty && passwordController.text.trim().isNotEmpty;
  }

}