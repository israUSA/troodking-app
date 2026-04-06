import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:troodking_app/categories/page/category_item_page.dart';
import 'package:troodking_app/categories/widgets/categories_card_widget.dart';
import 'package:troodking_app/shared/helpers/global_helper.dart';
import 'package:troodking_app/shared/helpers/responsive.dart';
import 'package:troodking_app/shared/models/button_type_enum.dart';
import 'package:troodking_app/shared/models/troodking_model.dart';
import 'package:troodking_app/shared/providers/functional_provider.dart';
import 'package:troodking_app/shared/widgets/alert_template.dart';
import 'package:troodking_app/shared/widgets/empty_data_message_widget.dart';
import 'package:troodking_app/shared/widgets/filled_button_widget.dart';
import 'package:troodking_app/shared/widgets/layout.dart';

class CategoriesPage extends StatefulWidget {
  CategoriesPage({
    super.key,
    required this.keyDismissPage,
  });

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
        return LayoutWidget(
          keyDismiss: widget.keyDismissPage,
          title: 'Categorías',
          nameInterceptor: 'categoriesPage',
          requiredStack: false,
          backPageView: true,
          child: SizedBox(
            height: responsive.hp(80),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                FilledButtonWidget(
                  text: 'Agregar Categoría',
                  typeButton: WidgetTypeEnum.sucess,
                  icon: Icons.add,
                  onPressed: () {
                    final keyAddCategorieAlert = GlobalHelper.genKey();
                    fp.showAlert(
                      key: keyAddCategorieAlert,
                      content: AlertGeneric(
                        content: AlertAddCategorieWidget(
                          keyToClose: keyAddCategorieAlert,
                        ),
                      ),
                    );
                  },
                ),

                fp.troodkingModel.isNotEmpty
                    ? GridView.builder(
                        itemCount: fp.troodkingModel.length,
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                        ),
                        itemBuilder: (context, index) {
                          return CategoriesCardWidget(
                            title: fp.troodkingModel[index].categorieName ?? '',
                            emojiIcon:fp.troodkingModel[index].categorieIcon ?? '',
                            onPressed: () {
                              final keyCategorieItemPage = GlobalHelper.genKey();
                              fp.addPage(
                                key: keyCategorieItemPage,
                                content: CategoryItemPage(
                                  key: keyCategorieItemPage,
                                  keyDismissPage: keyCategorieItemPage,
                                  troodkingModel: fp.troodkingModel[index],
                                ),
                              );
                            },
                          );
                        },
                      )
                    : Padding(
                        padding: EdgeInsets.only(top: responsive.hp(20)),
                        child: EmptyDataMessageWidget(
                          message: 'Sin categorías',
                        ),
                      ),
              ],
            ),
          ),
        );
      },
    );
  }
}
