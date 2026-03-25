import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:troodking_app/categories/page/categories_page.dart';
import 'package:troodking_app/env/theme/app_theme.dart';
import 'package:troodking_app/home/widgets/background_card_widget.dart';
import 'package:troodking_app/home/widgets/home_resume_widget.dart';
import 'package:troodking_app/shared/helpers/global_helper.dart';
import 'package:troodking_app/shared/helpers/responsive.dart';
import 'package:troodking_app/shared/providers/functional_provider.dart';
import 'package:troodking_app/shared/widgets/layout.dart';
import 'package:troodking_app/shared/widgets/separate_items_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    return Consumer<FunctionalProvider>(
      builder: (context, fp, child) {
        return LayoutWidget(
        requiredStack: true,
        child: Column(
          children: [
            SeparateItemsWidget(
              separationValue: responsive.hp(2.5),
              children: [
                BackgroundCardWidget(
                  title: 'Categorías',
                  foodIcon: AppTheme.categoriesIcon,
                  color: AppTheme.proteinColor,
                  onPressed: () {
                    final keyCategoriesPage = GlobalHelper.genKey();
                    fp.addPage(key: keyCategoriesPage, content: CategoriesPage());
                    
                  },
                ),
                BackgroundCardWidget(
                  title: 'Registro de compras',
                  foodIcon: AppTheme.buyFoodIcon,
                  color: AppTheme.accentColor,
                  onPressed: () {
                    
                  },
                )
              ],
            ),
      
            SizedBox(height: responsive.isTablet ? responsive.hp(15) : responsive.hp(10),),
      
            HomeResumeWidget()
      
            
            ],
          ),
        );
      },
    );
  }
}