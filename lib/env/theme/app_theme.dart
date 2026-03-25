import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFF0D47A1);    // Azul profundo (Confianza/Salud)
  static const Color secondaryColor = Color(0xFF42A5F5);  // Azul vibrante (Acciones/Botones)
  static const Color tertiaryColor = Color(0xFF1976D2);   // Azul medio (Resaltados)
  static const Color accentColor = Color(0xFF00BFA5);     // Verde azulado (Para cuando cumples un macro)

  // * BÁSICOS
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF121212);           // Un negro más suave para vista cansada
  static const Color transparent = Color(0x00000000);

  // * ESTADOS (Claves en nutrición)
  static const Color success = Color(0xFF4CAF50);         // Meta cumplida
  static const Color error = Color(0xFFE53935);           // Exceso de calorías
  static const Color caution = Color(0xFFFFA000);         // Alerta (Cerca del límite)
  static const Color energy = Color(0xFFFF6D00);          // Naranja (Para el hambre/Carbohidratos)

  // * FONDOS Y LAYOUT
  static const Color backgroundLayout = Color(0xFFF8FAFC); // Gris muy azulado y limpio
  static const Color cardBackground = Color(0xFFFFFFFF);
  static const Color softGrey = Color(0xFFF1F5F9);        // Fondo de inputs o botones secundarios

  // * TEXTOS
  static const Color textColor = Color(0xFF1E293B);       // Azul oscuro casi negro (Legibilidad)
  static const Color textInfoColor = Color(0xFF64748B);   // Gris azulado para detalles
  static const Color hintText = Color(0xFF94A3B8);
  static const Color colorTextForm = Color(0xFF334155);

  // * MACROS (Colores específicos para gráficas)
  static const Color proteinColor = Color(0xFF2563EB);    // Azul (Proteína)
  static const Color carbsColor = Color(0xFFF59E0B);      // Amarillo/Naranja (Carbohidratos)
  static const Color fatsColor = Color(0xFFEC4899);       // Rosa/Fucsia (Grasas)

  // * TARJETAS Y BORDES
  static const Color borderGrey = Color(0xFFE2E8F0);
  static const Color softCardBackground = Color(0xFFF8FAFC);
  static const Color shadowColor = Color(0x0A000000);   

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
  static const String categoriesIcon = "assets/categories.svg";
  static const String buyFoodIcon = "assets/food_money.svg";

 

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
