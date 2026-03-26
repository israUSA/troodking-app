import 'package:flutter/material.dart';
import 'package:troodking_app/shared/helpers/responsive.dart';
import 'package:troodking_app/shared/models/button_type_enum.dart';

class FilledButtonWidget extends StatefulWidget {
  const FilledButtonWidget({
    super.key,
    this.onPressed,
    required this.text,
    this.typeButton = WidgetTypeEnum.normal,
    this.width = 30,
    this.height = 40,
    this.borderRadius = 5,
    this.fontWeight = FontWeight.w400,
    this.fontSize,
    this.fontFamily,
    this.icon,
    this.iconSize,
    this.iconColor,
  });

  final void Function()? onPressed;
  final String text;
  final double? width;
  final double? height;
  final double? borderRadius;
  final FontWeight? fontWeight;
  final double? fontSize;
  final String? fontFamily;
  final WidgetTypeEnum typeButton;
  final IconData? icon;
  final double? iconSize;
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
            widget.width!,
            responsive.isTablet ? responsive.hp(5) : widget.height!,
          ),
        ),
        padding: responsive.isTablet
            ? WidgetStateProperty.all<EdgeInsetsGeometry>(
                EdgeInsetsGeometry.symmetric(horizontal: responsive.wp(4)),
              )
            : null,
        backgroundColor: WidgetStatePropertyAll(widget.typeButton.colorButton),
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
                  size: widget.iconSize ?? 20,
                  color: widget.iconColor ?? widget.typeButton.colorTextButton,
                ),
                const SizedBox(width: 8),
                Flexible(
                  child: Text(
                    widget.text,
                    style: TextStyle(
                      color: widget.typeButton.colorTextButton,
                      fontWeight: widget.fontWeight,
                      fontFamily: widget.fontFamily,
                      fontSize: widget.fontSize ?? responsive.dp(1.4),
                    ),
                  ),
                ),
              ],
            )
          : Text(
              widget.text,
              style: TextStyle(
                color: widget.typeButton.colorTextButton,
                fontWeight: widget.fontWeight,
                fontFamily: widget.fontFamily,
                fontSize: widget.fontSize ?? responsive.dp(1.4),
              ),
            ),
    );
  }
}
