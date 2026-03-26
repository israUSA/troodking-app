import 'package:flutter/material.dart';
import 'package:troodking_app/shared/helpers/responsive.dart';

import '../../env/theme/app_theme.dart';

class TextButtonWidget extends StatefulWidget {
  const TextButtonWidget({
    super.key,
    this.onPressed,
    required this.nameButton,
    this.fontSize = 15,
    this.color = AppTheme.primaryColor,
    this.underline = false, 
    this.fontWeight, 
    this.fontFamily, 
    this.whitPadding = true
  });

  final void Function()? onPressed;
  final String nameButton;
  final double? fontSize;
  final Color? color;
  final bool? underline;
  final FontWeight? fontWeight;
  final String? fontFamily;
  final bool? whitPadding;

  @override
  State<TextButtonWidget> createState() => _TextButtonWidgetState();
}

class _TextButtonWidgetState extends State<TextButtonWidget> {
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    return TextButton(
      style: widget.whitPadding!
      
      ? null
      : ButtonStyle(
        padding: WidgetStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.zero),
        minimumSize: WidgetStateProperty.all<Size>(const Size(0, 0)),
        maximumSize: WidgetStateProperty.all<Size>(const Size(300, 300)),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        
      ),
      onPressed: widget.onPressed,
      child: Text(
        widget.nameButton,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: widget.color,
          fontSize: widget.fontSize ?? responsive.dp(1.4),
          fontFamily: widget.fontFamily,
          fontWeight: widget.fontWeight ?? FontWeight.normal,
          decoration: widget.underline! ?  TextDecoration.underline : null,
          decorationColor: widget.color,
          decorationThickness: 2,
        ),
      ),
    );
  }
}
