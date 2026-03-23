import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color(0xff00A151);
  static const Color secondaryColor = Color(0xFf8edd65);
  static const Color tertiaryColor = Color(0xFF076a39);
  static const Color cuarternaryColor = Color(0xFF56c271);
  static const Color white = Color(0xFFFFFFFF);
  static const Color bordergrey = Color(0xFFB1B1B1);
  static const Color hinText = Color(0xFFA7A9AC);
  static const Color transparent = Color(0x00000000);
  static const Color error = Color(0xffF94838);
  static const Color colorButton = Color(0xFF0198fd);
  static const Color backgroundLayout = Color(0xFFF6F6F6);
  static const Color textColor = Color(0xFF97999b);
  static const Color textInfoColor = Color(0xFF7C7C7C);
  static const Color colorTextForm = Color(0xff5B5B5B);
  static const Color caution = Color(0xffffcf54);
  static const Color purple = Color(0xFF8819DF);
  static const Color pink = Color(0xFFDF1995);
  static const Color gray = Color(0xFFD1D3D4);
  static const Color black = Color(0xFF000000);
  static const Color cardBackground = Color(0xFFF7F7F7);
  static const Color backgroundTextForm = Color(0xFFF6F5F5);

  // * COLOR DE LAS TARJETAS
  static const Color textCard = Color(0xFF57636c);
  static const Color softCardBackground = Color(0xffF2F2F2);
  static const Color colorCardSchedule = Color.fromARGB(255, 178, 187, 255);
  static const Color textColorSupport = Color(0xFF12151c);
  static const Color softGrey = Color(0xFFF5F5F5);
  static const Color softGrey2 = Color(0xffE4E4E4);
  static const Color softGrey3 = Color(0xffF8F8F8);
  static const Color sideCardOrange = Color(0xFFF4A306);

  // * COLORES
static const Color color1 = Color(0xFFD1C9FF); // Lavanda suave
static const Color color2 = Color(0xFFFFD8A8); // Naranja melocotón
static const Color color3 = Color(0xFFFFC5C5); // Rosa coral pálido
static const Color color4 = Color(0xFFFFF9C4); // Amarillo crema
static const Color color5 = Color(0xFFC1E7D1); // Verde menta
static const Color color6 = Color(0xFFA2D2FF); // Azul cielo claro 


  // * ASSETS
  // static const String logoPrincipal = "assets/logo.png";
  // static const String camion = "assets/servitruck.png";
  

  //Icons
  // static const String logoIcon = "assets/logo_icon.svg";


  static const String icon404Path = "assets/404.png";

 

  // * FONTS
  static const String fontBariol = 'Bariol';
  static const String fontNexa = 'Nexa';
  static const String fontRoboto = 'Roboto';

  ThemeData theme() {
    return ThemeData(
      fontFamily: fontBariol,
      textSelectionTheme: const TextSelectionThemeData(
          selectionHandleColor: AppTheme.primaryColor,
          cursorColor: AppTheme.primaryColor),
      filledButtonTheme: const FilledButtonThemeData(
          style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(error))),
      useMaterial3: true,
    );
  }
}
