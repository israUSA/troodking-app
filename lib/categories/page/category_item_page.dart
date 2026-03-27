import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:troodking_app/shared/helpers/responsive.dart';
import 'package:troodking_app/shared/providers/functional_provider.dart';
import 'package:troodking_app/shared/widgets/layout.dart';

class CategoryItemPage extends StatefulWidget {
  const CategoryItemPage({super.key, required this.keyDismissPage});

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
        title: 'Productos',
        requiredStack: false,
        backPageView: true,
        nameInterceptor: 'categoriesProductsPage',
        child: Column(
          children: [

          ],
        ), 
        );
    },);
  }
}