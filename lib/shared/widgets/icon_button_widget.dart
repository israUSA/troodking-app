import 'package:flutter/material.dart';
import 'package:troodking_app/env/theme/app_theme.dart';
import 'package:troodking_app/shared/helpers/responsive.dart';

class IconButtonWidget extends StatefulWidget {
  final String? buttonText;
  final IconData? iconData;
  final Color? colorIcon;
  final Function() onPress;
  const IconButtonWidget({super.key, this.buttonText, this.iconData, this.colorIcon, required this.onPress});

  @override
  State<IconButtonWidget> createState() => _IconButtonWidgetState();
}

class _IconButtonWidgetState extends State<IconButtonWidget> {
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: widget.onPress,
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.success,
          borderRadius: BorderRadius.circular(20)
        ),
        constraints: BoxConstraints(
          minHeight: responsive.hp(7),
          minWidth: responsive.wp(40),
          maxHeight: responsive.hp(7),
          maxWidth: responsive.wp(60)
        ),
        padding: EdgeInsets.symmetric(horizontal: responsive.wp(2), vertical: responsive.hp(2)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              widget.iconData,
              color: widget.colorIcon ?? AppTheme.white,
            ),
            if(widget.buttonText != null)
              Text(
                widget.buttonText!,
                style: TextStyle(
                  fontSize: responsive.dp(2.0),
                  color: AppTheme.white,
                  fontWeight: FontWeight.bold
                ),
              ),
          ],
        ),
      ),
    );
  }
}
