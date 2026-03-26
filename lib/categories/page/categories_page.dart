import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:troodking_app/shared/helpers/global_helper.dart';
import 'package:troodking_app/shared/providers/functional_provider.dart';
import 'package:troodking_app/shared/widgets/alert_template.dart';
import 'package:troodking_app/shared/widgets/icon_button_widget.dart';
import 'package:troodking_app/shared/widgets/layout.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key, required this.keyDismissPage});

  final GlobalKey keyDismissPage;

  



  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<FunctionalProvider>(
      builder: (context, fp, child) {
        return  LayoutWidget(
        keyDismiss: widget.keyDismissPage,
        title: 'Categorías',
        nameInterceptor: 'categoriesPage',
        requiredStack: false, 
        backPageView: true,
        child: Column(
          children: [
            IconButtonWidget(
              buttonText: 'Agregar Categoría',
              iconData: Icons.add,
              onPress: () {
                final keyAddCategorieAlert = GlobalHelper.genKey();
                fp.showAlert(
                  key: keyAddCategorieAlert, 
                  content: AlertGeneric(
                    content: AlertAddCategorieWidget(
                      keyToClose: keyAddCategorieAlert,
                      confirm: () {
                        
                      },
                    )));
                
              },)
          ],
        ),
        
      );
      },
    );
  }
}