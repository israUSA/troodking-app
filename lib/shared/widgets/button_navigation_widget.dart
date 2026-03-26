import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:troodking_app/env/theme/app_theme.dart';
import 'package:troodking_app/shared/helpers/responsive.dart';

class ButtonNavigationWidget extends StatefulWidget {
  const ButtonNavigationWidget({super.key});

  @override
  State<ButtonNavigationWidget> createState() => _ButtonNavigationWidgetState();
}

class _ButtonNavigationWidgetState extends State<ButtonNavigationWidget> {

  bool openMenu = false;

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    return Center(
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        width: openMenu ? responsive.wp(80) : responsive.wp(20),
        child: Stack(
          children: [
            Positioned(
              bottom: 35,
              right: openMenu ? 10 : 0,
              left: openMenu ? null : 0,
              child: GestureDetector(
                onTap: () {
                  setState(() {});
                },
                child: Image.asset(
                    AppTheme.plateIcon,
                    width: responsive.dp(5),
                    height: responsive.dp(5),
                  ),
              ),
            ),
            Positioned(
              bottom: 35,
              left: openMenu ? 10 : 0,
              right: openMenu ? null : 0,
              child: GestureDetector(
                onTap: () {
                  setState(() {});
                },
                child: Image.asset(
                  AppTheme.plateIcon,
                  width: responsive.dp(5),
                  height: responsive.dp(5),
                ),
              ),
            ),
        
            Positioned(
              bottom: 35,
              left: 0,
              right: 0,
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    openMenu = !openMenu;
                    setState(() {});
                  },
                  child: Spin(
                    animate: openMenu,
                    duration: Duration(seconds: 1),
                    child: Image.asset(
                      AppTheme.plateIcon,
                      width: responsive.dp(7),
                      height: responsive.dp(7),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}