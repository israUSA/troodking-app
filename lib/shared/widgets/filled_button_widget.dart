import 'package:flutter/material.dart';
import 'package:troodking_app/env/theme/app_theme.dart';
import 'package:troodking_app/shared/helpers/responsive.dart';
import 'package:troodking_app/shared/models/button_type_enum.dart';

class FilledButtonWidget extends StatefulWidget {
  const FilledButtonWidget({
    super.key,
    this.onPressed,
    required this.text,
    this.typeButton = WidgetTypeEnum.normal,
    this.borderRadius = 20,
    this.fontSize,
    this.fontFamily,
    this.icon,
    this.iconColor,
  });

  final void Function()? onPressed;
  final String text;
  final double? borderRadius;
  final double? fontSize;
  final String? fontFamily;
  final WidgetTypeEnum? typeButton;
  final IconData? icon;
  final Color? iconColor;

  @override
  State<FilledButtonWidget> createState() => _FilledButtonWidgetState();
}

class _FilledButtonWidgetState extends State<FilledButtonWidget> {
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);

    return FilledButton(
      style: ButtonStyle(
        minimumSize: WidgetStateProperty.all<Size>(
          Size(
            responsive.wp(30),
            responsive.hp(5),
          ),
        ),
        maximumSize: WidgetStateProperty.all<Size>(
          Size(
            responsive.wp(60), 
            responsive.hp(7))
        ),
        padding: responsive.isTablet
            ? WidgetStateProperty.all<EdgeInsetsGeometry>(
                EdgeInsetsGeometry.symmetric(horizontal: responsive.wp(4)),
              )
            :  WidgetStateProperty.all<EdgeInsetsGeometry>(
              EdgeInsets.symmetric(horizontal: responsive.wp(2), vertical: responsive.hp(2)),
            )
,
        backgroundColor: WidgetStatePropertyAll(widget.typeButton!.colorButton),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius!),
          ),
        ),
      ),
      onPressed: widget.onPressed,
      child: widget.icon != null
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  widget.icon,
                  size: responsive.dp(2.1),
                  color: widget.iconColor ?? widget.typeButton!.colorTextButton,
                ),
                const SizedBox(width: 8),
                Flexible(
                  child: Text(
                    widget.text,
                    style: TextStyle(
                      color: AppTheme.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: widget.fontFamily,
                      fontSize: widget.fontSize ?? responsive.dp(2),
                    ),
                  ),
                ),
              ],
            )
          : Text(
              widget.text,
              style: TextStyle(
                color: AppTheme.white,
                fontWeight: FontWeight.bold,
                fontFamily: widget.fontFamily,
                fontSize: widget.fontSize ?? responsive.dp(1.4),
              ),
            ),
    );
  }
}
