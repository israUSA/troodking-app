import 'package:flutter/material.dart';
import 'package:troodking_app/env/theme/app_theme.dart';
import 'package:troodking_app/shared/helpers/responsive.dart';

class OutlinedButtonWidget extends StatelessWidget {
  const OutlinedButtonWidget(
      {super.key,
      this.onPressed,
       this.color = AppTheme.primaryColor,
      required this.text,
      this.width = double.infinity,
      this.height = 40,
      this.borderRadius = 5, 
      this.fontSize, 
      this.withPadding = true, 
      this.iconData});

  final void Function()? onPressed;
  final Color? color;
  final String text;
  final double? width;
  final double? height;
  final double? borderRadius;
  final double? fontSize;
  final bool? withPadding;
  final IconData? iconData;

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);

    return OutlinedButton(
        style: OutlinedButton.styleFrom(
          minimumSize: Size(width!, responsive.isTablet ? responsive.hp(4) : height!) ,
          padding: withPadding! ? null : EdgeInsets.symmetric(horizontal: responsive.hp(1)),
          side: BorderSide(
              color: color!, 
              width: 1.0),
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(borderRadius!), 
          ),
        ),
        onPressed: onPressed,
        child: iconData != null 

        ? Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(iconData, color: AppTheme.cautionCard),
            SizedBox(width: responsive.wp(1),),
            Text(text,
            style: TextStyle(
                color: color,
                fontWeight: FontWeight.w600,
                fontSize: fontSize ?? responsive.dp(1.4)))
          ],
        )
        :Text(text,
            style: TextStyle(
                color: color,
                fontWeight: FontWeight.w600,
                fontSize: fontSize ?? responsive.dp(1.4))));
  }
}
