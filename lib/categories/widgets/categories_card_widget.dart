import 'package:flutter/material.dart';

class CategoriesCardWidget extends StatefulWidget {
  const CategoriesCardWidget({super.key, required this.onPressed, required this.title});

  final String title;
  final void Function() onPressed;
  


  @override
  State<CategoriesCardWidget> createState() => _CategoriesCardWidgetState();
}

class _CategoriesCardWidgetState extends State<CategoriesCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          
        },
        child: Column(
          
        ),
      ),
    );
  }
}