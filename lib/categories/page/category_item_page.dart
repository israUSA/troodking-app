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

class _CategoryItemPageState extends State<CategoryItemPage> with SingleTickerProviderStateMixin {
  
  List<Color> colors = [AppTheme.proteinColor, AppTheme.accentColor, AppTheme.carbsColor, AppTheme.energy, AppTheme.fatsColor];
  late AnimationController _controller;


  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    return Consumer<FunctionalProvider>(
      builder: (context, fp, child) {
      return LayoutWidget(
        keyDismiss: widget.keyDismissPage,
        title: widget.title,
        requiredStack: false,
        showButtonNavigation: false,
        backPageView: true,
        nameInterceptor: 'categoriesProductsPage',
        child: Column(
          children: [
            InkWell(
              onTap: () {
                
              },
              child: AnimatedBuilder(
                animation: _controller,
                  builder: (context, child) {
                     double progress = _controller.value * colors.length;
  
                    int index = progress.floor() % colors.length; 
                    int nextIndex = (index + 1) % colors.length;

                    // Creamos una transición suave entre el color actual y el siguiente
                    double colorT = progress - progress.floor();
                    
                    Color color1 = Color.lerp(
                      colors[index],
                      colors[nextIndex],
                      colorT,
                    )!;
                    Color color2 = Color.lerp(
                      colors[nextIndex],
                      colors[(nextIndex + 1) % colors.length],
                      colorT,
                    )!;

                    return Container(
                    padding: EdgeInsets.symmetric(
                      vertical: responsive.dp(2),
                      horizontal: responsive.dp(10),
                    ),
                    decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(responsive.dp(2)),
                    gradient: LinearGradient(
                      begin: Alignment(-1.0, -1.0 + _controller.value * 2), 
                      end: Alignment(1.0, 1.0 - _controller.value * 2),
                      colors: [color1, color2],
                    ),
                  ),
                    child: Icon(
                      Icons.qr_code_scanner_rounded,
                      color: AppTheme.white,
                      size: responsive.dp(15),
                    ),
                  );
                },
              ),
              ),

              Container(
                margin: EdgeInsets.symmetric(vertical: responsive.hp(2)),
                height: responsive.hp(50),
                child: GridView.count(
                  crossAxisCount: 3,
                  padding: EdgeInsets.symmetric(vertical: responsive.hp(1)),
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
                    CategoryItemCardWidget(
                      onDelete: () {
                      
                    },),
                    CategoryItemCardWidget(
                      onDelete: () {
                      
                    },),
                    CategoryItemCardWidget(
                      onDelete: () {
                      
                    },),
                    CategoryItemCardWidget(
                      onDelete: () {
                      
                    },),
                    CategoryItemCardWidget(
                      onDelete: () {
                      
                    },),
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
                ),
              ),

            FilledButtonWidget(
              text: 'Eliminar Categoría',
              icon: Icons.delete,
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