import 'package:flutter/material.dart';
import 'package:troodking_app/env/theme/app_theme.dart';
import 'package:troodking_app/shared/helpers/responsive.dart';
import 'package:troodking_app/shared/models/button_type_enum.dart';
import 'package:troodking_app/shared/widgets/filled_button_widget.dart';
import 'package:troodking_app/shared/widgets/layout.dart';
import 'package:troodking_app/shared/widgets/text_form_field_widget.dart';
import 'package:troodking_app/shared/widgets/title.dart';

class ItemViewPage extends StatefulWidget {
  const ItemViewPage({super.key, required this.keyDismissPage});

  final GlobalKey keyDismissPage;


  @override
  State<ItemViewPage> createState() => _ItemViewPageState();
}

class _ItemViewPageState extends State<ItemViewPage> {
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    return LayoutWidget(
      keyDismiss: widget.keyDismissPage,
      nameInterceptor: 'ItemViewPage',
      title: 'Producto',
      backPageView: true,
      requiredStack: false,
      showButtonNavigation: false,
      child: Column(
        children: [

          TitleWidget(title: 'Macros', fontSize: responsive.dp(2.5),),

          SizedBox(height: responsive.hp(2),),

          Container(
            height: responsive.hp(60),
            width: responsive.wp(100),
            decoration: BoxDecoration(
              color: AppTheme.carbsColor.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(12),
              border: BoxBorder.all(
                color: AppTheme.carbsColor,
                width: 5
              )
            ),
            child: Stack(
              children: [

                Positioned(
                  top: 5,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Stack(
                      children: [
                        Container(
                          height: responsive.hp(1.5),
                          width: responsive.wp(30),
                          decoration: BoxDecoration(
                            color: AppTheme.textCard
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          child: Container(
                            height: responsive.hp(0.75),
                            width: responsive.wp(30),
                            decoration: BoxDecoration(
                              color: AppTheme.textPrimary.withValues(alpha: 0.6),
                              boxShadow: [
                                BoxShadow(
                                  color: AppTheme.textPrimary.withValues(alpha: 0.6),
                                  blurRadius: 5,
                                  spreadRadius: 2,
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),),

                Positioned(
                  top: 10,
                  left: 10,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: responsive.hp(3),
                        width: responsive.hp(3),
                        decoration: BoxDecoration(
                          color: AppTheme.textCard,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: AppTheme.textCard.withValues(alpha: 0.7),
                              blurRadius: 5,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                      ),
                      Transform.rotate(
                        angle: 45,
                        child: Container(
                          height: responsive.hp(0.7),
                          width: responsive.hp(2.5),
                          decoration: BoxDecoration(
                            color: AppTheme.textTertiary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: responsive.hp(3),
                        width: responsive.hp(3),
                        decoration: BoxDecoration(
                          color: AppTheme.textCard,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: AppTheme.textCard.withValues(alpha: 0.7),
                              blurRadius: 5,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                      ),
                      Transform.rotate(
                        angle: -45,
                        child: Container(
                          height: responsive.hp(0.7),
                          width: responsive.hp(2.5),
                          decoration: BoxDecoration(
                            color: AppTheme.textTertiary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 10,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: responsive.hp(3),
                        width: responsive.hp(3),
                        decoration: BoxDecoration(
                          color: AppTheme.textCard,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: AppTheme.textCard.withValues(alpha: 0.7),
                              blurRadius: 5,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                      ),
                      Transform.rotate(
                        angle: -45,
                        child: Container(
                          height: responsive.hp(0.7),
                          width: responsive.hp(2.5),
                          decoration: BoxDecoration(
                            color: AppTheme.textTertiary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: responsive.hp(3),
                        width: responsive.hp(3),
                        decoration: BoxDecoration(
                          color: AppTheme.textCard,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: AppTheme.textCard.withValues(alpha: 0.7),
                              blurRadius: 5,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                      ),
                      Transform.rotate(
                        angle: 45,
                        child: Container(
                          height: responsive.hp(0.7),
                          width: responsive.hp(2.5),
                          decoration: BoxDecoration(
                            color: AppTheme.textTertiary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Column(
                  children: [
                    
                    
                  ],
                ),
              ],
            ),
          ),

          SizedBox(height: responsive.hp(1),),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormFieldWidget(
                hintText: 'Precio',
                maxWidth: responsive.wp(40),
                maxHeigth: responsive.hp(5),
                borderWith: 3,
                colorBorder: AppTheme.fatsColor,
                borderRadius: 0,
                fontSize: responsive.dp(2.3),
              ),
              TextFormFieldWidget(
                hintText: 'Gramos',
                maxWidth: responsive.wp(40),
                maxHeigth: responsive.hp(5),
                borderWith: 3,
                colorBorder: AppTheme.fatsColor,
                borderRadius: 0,
                fontSize: responsive.dp(2.3),

              )
            ],
          ),

          SizedBox(height: responsive.hp(2),),

          FilledButtonWidget(
            typeButton: WidgetTypeEnum.sucess,
            text: 'Agregar')

        ],
      ), 
      );
  }
}