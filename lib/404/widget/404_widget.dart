import 'package:flutter/material.dart';
import '../../../env/theme/app_theme.dart';

Widget drawerWidget404(BuildContext context) {
  return Container(
    color: AppTheme.white,
    child: SizedBox.expand( 
      child: Image.asset(
        AppTheme.icon404Path,
        fit: BoxFit.cover,
      ),
    ),
  );
}

