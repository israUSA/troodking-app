import 'package:flutter/material.dart';
import 'package:troodking_app/shared/widgets/layout.dart';
import 'package:troodking_app/shared/widgets/title.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  @override
  Widget build(BuildContext context) {
    return const LayoutWidget(
      requiredStack: false, 
      child: Column(
        children: [
          TitleWidget(title: 'Categorías')
        ],
      ),
      
    );
  }
}