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

  // * TEXTOS
  static const Color textColor = Color(0xFF1E293B);       // Azul oscuro casi negro (Legibilidad)
  static const Color textInfoColor = Color(0xFF64748B);   // Gris azulado para detalles
  static const Color hintText = Color(0xFF94A3B8);
  static const Color colorTextForm = Color(0xFF334155);
  static const Color textPrimary = Color(0xff191A1A);
  static const Color textSecondary = Color(0xFF52525C);
  static const Color textTertiary = Color(0xFFD9D9D9);
  static const Color textAlternative = Color(0xFF555555);

  // * MACROS (Colores específicos para gráficas)
  static const Color proteinColor = Color(0xFF2563EB);    // Azul (Proteína)
  static const Color carbsColor = Color(0xFFF59E0B);      // Amarillo/Naranja (Carbohidratos)
  static const Color fatsColor = Color(0xFFEC4899);       // Rosa/Fucsia (Grasas)

  // * TARJETAS Y BORDES
  static const Color sucessBorder = Color(0xFFA4F4CF);
  static const Color borderGrey = Color(0xFFE2E8F0);
  static const Color softCardBackground = Color(0xFFF8FAFC);
  static const Color shadowColor = Color(0x0A000000);   

    // * COLOR DE LAS TARJETAS
  static const Color cautionCard = Color(0xFFFFD230);
  static const Color cautionCardSoft = Color(0xFFFEE685);
  static const Color errorCard = Color(0xFFFFA2A2);
  static const Color confirmCard = Color(0xFF8EC5FF);
  static const Color confirmCardSoft = Color(0xFFBEDBFF);
  static const Color textCard = Color(0xFF57636c);
  static const Color colorCardSchedule = Color.fromARGB(255, 178, 187, 255);
  static const Color textColorSupport = Color(0xFF12151c);
  static const Color softGrey = Color(0xFFF5F5F5);
  static const Color softGrey2 = Color(0xffE4E4E4);
  static const Color softGrey3 = Color(0xffF8F8F8);

  static const String icon404Path = "assets/404.png";
  static const String plateIcon = "assets/plate.png";
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
