import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:troodking_app/env/theme/app_theme.dart';
import 'package:troodking_app/shared/helpers/global_helper.dart';
import 'package:troodking_app/shared/helpers/responsive.dart';
import 'package:troodking_app/shared/providers/functional_provider.dart';
import 'package:troodking_app/shared/widgets/alert_template.dart';
import 'package:troodking_app/shared/widgets/icon_button_widget.dart';
import 'package:troodking_app/shared/widgets/layout.dart';
import 'package:troodking_app/shared/widgets/title.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key, required this.keyDismissPage});

  final GlobalKey keyDismissPage;

  



  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    return Consumer<FunctionalProvider>(
      builder: (context, fp, child) {
        return  LayoutWidget(
        keyDismiss: widget.keyDismissPage,
        title: 'Categorías',
        nameInterceptor: 'categoriesPage',
        requiredStack: false, 
        backPageView: true,
        child: SizedBox(
          height: responsive.hp(80),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // IconButtonWidget(
              //   buttonText: 'Agregar Categoría',
              //   iconData: Icons.add,
              //   onPress: () {
              //     final keyAddCategorieAlert = GlobalHelper.genKey();
              //     fp.showAlert(
              //       key: keyAddCategorieAlert, 
              //       content: AlertGeneric(
              //         content: AlertAddCategorieWidget(
              //           keyToClose: keyAddCategorieAlert,
              //           confirm: () {
                          
              //           },
              //           ),
              //         ),
              //       );
              //     },
              //   ),
                InkWell(
                  onTap: () {
                    final keyAddCategorieAlert = GlobalHelper.genKey();
                    fp.showAlert(
                      key: keyAddCategorieAlert,
                      content: AlertGeneric(
                        content: AlertAddCategorieWidget(
                          keyToClose: keyAddCategorieAlert,
                          confirm: () {
                            
                          },
                        ),
                      ),
                    );
                  },
                  splashColor: AppTheme.proteinColor.withValues(alpha: 0.4),
                  child: DottedBorder(
                    options: RectDottedBorderOptions(
                      dashPattern: [7, 5],
                      strokeWidth: 4,
                      padding: EdgeInsets.all(responsive.dp(6)),
                      color: AppTheme.primaryColor,
                    ),
                    child: Column(
                      children: [
                        Icon(Icons.add, color: AppTheme.primaryColor, size: responsive.dp(4),),
                        SizedBox(height: responsive.hp(1),),
                        TitleWidget(title: 'Agregar Categoría', fontSize: responsive.dp(2.2),)
                      ],
                    )),
                )
              ],
            ),
        ),
        );
      },
    );
  }
}
