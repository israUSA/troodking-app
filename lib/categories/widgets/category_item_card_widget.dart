import 'package:flutter/material.dart';
import 'package:troodking_app/env/theme/app_theme.dart';
import 'package:troodking_app/shared/helpers/responsive.dart';
import 'package:troodking_app/shared/widgets/title.dart';

class CategoryItemCardWidget extends StatefulWidget {
  const CategoryItemCardWidget({super.key, required this.onDelete});
    final void Function() onDelete;


  @override
  State<CategoryItemCardWidget> createState() => _CategoryItemCardWidgetState();
}

class _CategoryItemCardWidgetState extends State<CategoryItemCardWidget> {
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    return Card(
      color: AppTheme.white,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Colors.blue, // Color del borde
          width: 2.0, // Grosor del borde
        ),
        borderRadius: BorderRadius.circular(10.0), // Esquinas redondeadas
      ),

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
          Column(
            children: [
              Image.network('https://veggiedeli.com.ec/wp-content/uploads/2022/10/spaghetti-producto-VegguiDeli.jpg'),
              TitleWidget(title: 'Pasta 1' ),
            ],
          ),
        ],
      ),
    );
  }
}