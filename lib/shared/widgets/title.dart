import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:troodking_app/env/theme/app_theme.dart';
import 'package:troodking_app/shared/helpers/responsive.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget(
      {super.key,
      this.fontSize = 20,
      this.imagePath = '',
      required this.title,
      this.fontWeight = FontWeight.w500,
      this.mainAxisAlignment = MainAxisAlignment.start,
      this.color = AppTheme.colorTextForm,
      this.sizeIcon, this.fontFamily});

  final double? fontSize;
  final String? imagePath;
  final String title;
  final FontWeight fontWeight;
  final MainAxisAlignment mainAxisAlignment;
  final Color color;
  final double? sizeIcon;
  final String? fontFamily;

  @override
  Widget build(BuildContext context) {

    final responsive = Responsive(context);

    return  Wrap(
    crossAxisAlignment: WrapCrossAlignment.center,
    
    children: [
      imagePath != ''
          ? SvgPicture.asset(imagePath!, width: sizeIcon ?? 30)
          : const SizedBox(),
      imagePath != '' ? SizedBox(width: responsive.isTablet? responsive.wp(1.5) : 7) : const SizedBox(),
      Text(
        title,
        style: TextStyle(
          color: color,
          fontWeight: fontWeight,
          fontSize: responsive.isTablet ? responsive.dp(1.8) : fontSize,
          fontFamily: fontFamily ?? AppTheme.fontNexa

        ),
        textAlign: TextAlign.start,
      ),
    ],
  );
  }
}
