import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:troodking_app/categories/widgets/category_item_card_widget.dart';
import 'package:troodking_app/env/theme/app_theme.dart';
import 'package:troodking_app/shared/helpers/global_helper.dart';
import 'package:troodking_app/shared/helpers/responsive.dart';
import 'package:troodking_app/shared/models/button_type_enum.dart';
import 'package:troodking_app/shared/providers/functional_provider.dart';
import 'package:troodking_app/shared/widgets/alert_template.dart';
import 'package:troodking_app/shared/widgets/filled_button_widget.dart';
import 'package:troodking_app/shared/widgets/icon_button_widget.dart';
import 'package:troodking_app/shared/widgets/layout.dart';

class CategoryItemPage extends StatefulWidget {
  const CategoryItemPage({super.key, required this.keyDismissPage, required this.title});

  final String title;
  final GlobalKey keyDismissPage;

  @override
  State<CategoryItemPage> createState() => _CategoryItemPageState();
}

class _CategoryItemPageState extends State<CategoryItemPage> {
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    return Consumer<FunctionalProvider>(
      builder: (context, fp, child) {
      return LayoutWidget(
        keyDismiss: widget.keyDismissPage,
        title: widget.title,
        requiredStack: false,
        backPageView: true,
        nameInterceptor: 'categoriesProductsPage',
        child: Column(
          children: [

            InkWell(
              onTap: () {
                
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: responsive.dp(2), horizontal: responsive.dp(8)),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(responsive.dp(2)),
                  border: Border.all( 
                    color: AppTheme.carbsColor,
                    width: responsive.dp(1))
                ),
                child: Icon(Icons.qr_code, size: responsive.dp(15),),
              ),
            ),

              GridView.count(
                shrinkWrap: true, 
                crossAxisCount: 3,
                children: [
                  CategoryItemCardWidget(
                    onDelete: () {
                    
                  },),
                  CategoryItemCardWidget(
                    onDelete: () {
                    
                  },),
                  CategoryItemCardWidget(
                    onDelete: () {
                    
                  },),
                ],
                
                // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                //   crossAxisCount: 3,
                //   mainAxisSpacing: 10,
                //   crossAxisSpacing: 10,
                // ),
                // itemBuilder: (context, index) {
                //   return CategoryItemCardWidget(
                //     onDelete: () {
                    
                //   },);
                // },
              )   ,     

            FilledButtonWidget(
              text: 'Eliminar Categoría',
              icon: Icons.delete_forever,
              typeButton: WidgetTypeEnum.cancel,
              onPressed: () {
                final keyAlertDeleteCategorie = GlobalHelper.genKey();
                fp.showAlert(
                  key: keyAlertDeleteCategorie, 
                  content: AlertGeneric(
                    content: AlertDeleteCategorieWidget(
                      keyToClose: keyAlertDeleteCategorie, 
                      confirm: () {
                        
                      },)));
              },
              ),
            ],
          ),
        );
      },
    );
  }
}