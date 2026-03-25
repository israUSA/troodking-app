import 'package:flutter/material.dart';
import 'package:troodking_app/env/theme/app_theme.dart';
import 'package:troodking_app/shared/helpers/responsive.dart';
import 'package:troodking_app/shared/widgets/text.dart';

class EmptyDataMessageWidget extends StatelessWidget {
  const EmptyDataMessageWidget(
      {super.key,
      this.iconName,
      required this.message,
      this.color});

  final String? iconName;
  final String message;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(vertical: responsive.hp(2)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextWidget(title: '😫', fontSize: responsive.dp(4),),
              SizedBox(
                height: responsive.hp(1),
              ),
              TextWidget(
                title: message,
                fontSize: responsive.dp(1.8),
                fontFamily: AppTheme.fontBariol,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
