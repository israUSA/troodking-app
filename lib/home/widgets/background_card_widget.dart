import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:troodking_app/env/theme/app_theme.dart';
import 'package:troodking_app/shared/helpers/responsive.dart';
import 'package:troodking_app/shared/widgets/title.dart';

class BackgroundCardWidget extends StatefulWidget {
  const BackgroundCardWidget({super.key, required this.title, required this.foodIcon, required this.color, required this.onPressed});

  final String title;
  final String foodIcon;
  final Color color;
  final void Function() onPressed;

  @override
  State<BackgroundCardWidget> createState() => _BackgroundCardWidgetState();
}

class _BackgroundCardWidgetState extends State<BackgroundCardWidget> {
  
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    return Card(
      color: widget.color,
      elevation: 10,
      child: InkWell(
        onTap: widget.onPressed,
        child: SizedBox(
          height: responsive.hp(15),
          width: double.infinity,
          child: Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: responsive.wp(4)),
            child: Stack(
              alignment: AlignmentGeometry.center,
              children: [
                SvgPicture.asset(widget.foodIcon, colorFilter: ColorFilter.mode(
                      AppTheme.white.withValues(alpha: 0.3),
                      BlendMode.modulate,
                    ),),
                TitleWidget(title: widget.title, color: AppTheme.white, fontSize: responsive.dp(2.1),  fontWeight: FontWeight.bold,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}