import 'package:flutter/material.dart';
import 'package:troodking_app/env/theme/app_theme.dart';
import 'package:troodking_app/shared/helpers/responsive.dart';

class TextWidget extends StatelessWidget {
  final String title;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final String fontFamily;
  final bool underline;
  final bool isLetterSpacing;

  const TextWidget({
    super.key,
    required this.title,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.textAlign,
    this.underline = false, 
    this.fontFamily = AppTheme.fontNexa, 
    this.isLetterSpacing = false
  });

  @override
  Widget build(BuildContext context) {
  final responsive = Responsive(context);
    return Text(
      textAlign: textAlign,
      title,
      style: TextStyle(
        color: color,
        fontSize: fontSize ?? responsive.dp(1.562),
        fontFamily: fontFamily,
        fontWeight: fontWeight,
        decoration: underline ?  TextDecoration.underline : null,
        decorationColor: color,
        letterSpacing: isLetterSpacing ? 1.7 : null,
        

      )
    );
  }
}