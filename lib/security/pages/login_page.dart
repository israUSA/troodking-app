import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:troodking_app/env/theme/app_theme.dart';
import 'package:troodking_app/security/controller/login_page_controller.dart';
import 'package:troodking_app/security/service/login_service.dart';
import 'package:troodking_app/shared/helpers/global_helper.dart';
import 'package:troodking_app/shared/helpers/responsive.dart';
import 'package:troodking_app/shared/models/button_type_enum.dart';
import 'package:troodking_app/shared/providers/functional_provider.dart';
import 'package:troodking_app/shared/widgets/alert_modal.dart';
import 'package:troodking_app/shared/widgets/alert_template.dart';
import 'package:troodking_app/shared/widgets/filled_button_widget.dart';
import 'package:troodking_app/shared/widgets/separate_items_widget.dart';
import 'package:troodking_app/shared/widgets/text_button_widget.dart';
import 'package:troodking_app/shared/widgets/text_form_field_widget.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:troodking_app/shared/widgets/title.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool alertModalBool = true;
  LoginPageController controller = LoginPageController();
  LoginService loginService = LoginService();

  tryLogin(FunctionalProvider fp) async {
    if (controller.loginFormIsNotEmpty()) {
      final alertLoadingKey = GlobalHelper.genKey();
      fp.showAlert(key: alertLoadingKey, content: AlertLoading());
      try {

        final login = await loginService.signIn(
          controller.emailController.text,
          controller.passwordController.text,
        );

        if (login.user != null || login.session != null) {
          log('Datos del Usuario: ${jsonEncode(login.user!.toJson())}');
          log('Datos de la Sesión: ${jsonEncode(login.session!.toJson())}');
        }

        
        if (mounted && login.user != null) {
          fp.dismissAlert(key: alertLoadingKey);
          GlobalHelper.navigateToPageRemove(context, '/home');
        }
      } on AuthException catch (error) {
        log('AuthException: ${error.message}');
        if (mounted) {
          final keyerror = GlobalHelper.genKey();
          fp.showAlert(
            key: keyerror,
            content: AlertGeneric(
              content: WarningAlert(
                keyToClose: keyerror,
                title: 'Error de Autenticación',
                message: 'Credenciales incorrectas',
              ),
            ),
          );
        }
      } catch (error) {
        log('Error inesperado: $error');
        if (mounted) {
          final keyerror = GlobalHelper.genKey();
          fp.showAlert(
            key: keyerror,
            content: AlertGeneric(
              content: WarningAlert(
                keyToClose: keyerror,
                title: 'Error',
                message: 'Ocurrió un error inesperado. Inténtelo de nuevo.',
              ),
            ),
          );
        }
      } finally{
        await Future.delayed(Duration(milliseconds: 500), () {
          fp.dismissAlert(key: alertLoadingKey);
          
        });
      }
    } else {
      final keylogin = GlobalHelper.genKey();
      fp.showAlert(
        key: keylogin,
        content: AlertGeneric(
          content: WarningAlert(
            keyToClose: keylogin,
            title: 'Campos Incompletos',
            message: 'No puedes dejar campos vacíos. Por favor, llena todos los campos para acceder.',
          ),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    controller.emailController.text = 'leonardosellan20@gmail.com';
  }

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    return Consumer<FunctionalProvider>(
      builder: (context, fp, child) {
        return Scaffold(
          body: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TitleWidget(
                    title: 'Iniciar sesión',
                    fontSize: responsive.dp(3.5),
                    fontWeight: FontWeight.bold,
                    color: AppTheme.accentColor,
                  ),

                  Padding(
                    padding: EdgeInsetsGeometry.symmetric(
                      horizontal: responsive.wp(4),
                    ),
                    child: SeparateItemsWidget(
                      children: [
                        TextFormFieldWidget(
                          hintText: 'Correo',
                          controller: controller.emailController,
                        ),
                        TextFormFieldWidget(
                          hintText: 'Contraseña',
                          controller: controller.passwordController,
                          obscureText: controller.showPassword,
                          suffixIcon: IconButton(
                            icon: !controller.showPassword
                                ? Icon(
                                    Icons.remove_red_eye_outlined,
                                    size: responsive.dp(1.9),
                                  )
                                : Icon(
                                    Icons.visibility_off_outlined,
                                    size: responsive.dp(1.9),
                                  ),
                            onPressed: () {
                              setState(() {
                                controller.showPassword = !controller.showPassword;
                              });
                            },
                          ),
                        ),
                        Center(
                          child: FilledButtonWidget(
                            text: 'Iniciar Sesión',
                            typeButton: WidgetTypeEnum.confirm,
                            onPressed: () => tryLogin(fp),
                          ),
                        ),
                      ],
                    ),
                  ),

                  TextButtonWidget(
                    nameButton: 'No tienes una cuenta?, registrate',
                    underline: true,
                    onPressed: () {},
                  ),
                ],
              ),
              alertModalBool ? AlertModal() : SizedBox()
            ],
          ),
        );
      },
    );
  }
}
