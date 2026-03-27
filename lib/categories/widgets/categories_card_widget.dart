import 'package:flutter/material.dart';
import 'package:troodking_app/env/theme/app_theme.dart';
import 'package:troodking_app/shared/helpers/responsive.dart';
import 'package:troodking_app/shared/widgets/title.dart';

class CategoriesCardWidget extends StatefulWidget {
  const CategoriesCardWidget({super.key, required this.onPressed, required this.title, required this.emojiIcon});

  final String title;
  final String emojiIcon;
  final void Function() onPressed;
  


  @override
  State<CategoriesCardWidget> createState() => _CategoriesCardWidgetState();
}

class _CategoriesCardWidgetState extends State<CategoriesCardWidget> {
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    return Card(
      color: AppTheme.white,
      child: InkWell(
        onTap: widget.onPressed,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: responsive.hp(6),
              child: Text(
                widget.emojiIcon,
                style: TextStyle(
                  fontSize: responsive.dp(5)
                ),
              ),
            ),
            TitleWidget(title: widget.title)
          ],
          
        ),
      ),
    );
  }
}