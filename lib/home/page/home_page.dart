import 'package:flutter/material.dart';
import 'package:troodking_app/shared/widgets/layout.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return LayoutWidget(
      child: Placeholder(),
    );
  }
}