import 'package:flutter/material.dart';
import 'package:troodking_app/env/theme/app_theme.dart';
import 'package:troodking_app/shared/helpers/responsive.dart';
import 'package:troodking_app/shared/widgets/title.dart';

class CategoriesCardWidget extends StatefulWidget {
  const CategoriesCardWidget({super.key, required this.onPressed, required this.title, required this.emojiIcon, required this.onDelete});

  final String title;
  final String emojiIcon;
  final void Function() onPressed;
  final void Function() onDelete;
  


  @override
  State<CategoriesCardWidget> createState() => _CategoriesCardWidgetState();
}

class _CategoriesCardWidgetState extends State<CategoriesCardWidget> {
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    return Card(
      color: AppTheme.white,
      child: Stack(
        alignment: AlignmentGeometry.center,
        children: [
          Positioned(
            top: 3,
            right: 5,
            child: InkWell(
              onTap: widget.onDelete,
              child: Container(
                height: responsive.dp(2),
                width: responsive.dp(2),
                decoration: BoxDecoration(
                  color: AppTheme.error,
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.close, color: AppTheme.white, size: responsive.dp(2), fontWeight: FontWeight.bold,),
              ),
            ),
          ),

          InkWell(
            onTap: widget.onPressed,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
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
        ],
      ),
    );
  }
}