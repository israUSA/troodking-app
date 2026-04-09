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
          color: Colors.blue, 
          width: 4.0,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),

      child: Stack(
        alignment: AlignmentGeometry.center,
        clipBehavior: Clip.none,
        children: [
          Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network('https://veggiedeli.com.ec/wp-content/uploads/2022/10/spaghetti-producto-VegguiDeli.jpg', )),
              Padding(
                padding: EdgeInsets.only(left: responsive.wp(2)),
                child: Row(children: [
                  Expanded(
                    flex: 2,
                    child: Row(
                      children: [
                        TitleWidget(title: 'P: 100', fontSize: responsive.dp(1.7), fontWeight: FontWeight.bold,)
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Row(
                      children: [
                        TitleWidget(title: 'C: 120', fontSize: responsive.dp(1.7), fontWeight: FontWeight.bold)
                                    
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Row(
                      children: [
                        TitleWidget(title: 'G: 80', fontSize: responsive.dp(1.7), fontWeight: FontWeight.bold)
                                    
                      ],
                    ),
                  )
                ],),
              )
            ],
          ),
          Positioned(
            top: 0, 
            right: 0,
            child: GestureDetector(
              onTap: widget.onDelete,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(10.0),
                  bottomLeft: Radius.circular(
                    30.0,
                  ), 
                ),
                child: Container(
                  width: responsive.dp(3.2),
                  height: responsive.dp(3.2),
                  color: AppTheme.error,
                  child: Icon(
                    Icons.close,
                    color: AppTheme.white,
                    size: responsive.dp(1.8),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: -10,
            child: Container(
              padding: EdgeInsets.all(responsive.dp(0.5)),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: TitleWidget(title: 'Mejor opción', color: AppTheme.white, fontSize: responsive.dp(1.5), ),
            ),
          )
        ],
      ),
    );
  }
}