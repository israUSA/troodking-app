import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:troodking_app/env/theme/app_theme.dart';
import 'package:troodking_app/shared/helpers/global_helper.dart';
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
    
    final double mainSize = responsive.dp(7);
    final double itemSize = responsive.dp(5);
    
    final double containerWidth = openMenu ? 220.0 : mainSize;
    final double containerHeight = openMenu ? 180.0 : 110.0;
    
    const double bottomPadding = 35.0;

    final double closedLeftRight = (mainSize - itemSize) / 2;
    final double openCenterLeft = (220.0 - itemSize) / 2;

    return Align(
      alignment: Alignment.bottomCenter,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        width: containerWidth,
        height: containerHeight,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOutBack,
              bottom: openMenu ? bottomPadding + (mainSize - itemSize) / 2 : bottomPadding + (mainSize - itemSize) / 2,
              left: openMenu ? 10.0 : closedLeftRight,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 200),
                opacity: openMenu ? 1.0 : 0.0,
                child: AnimatedScale(
                  duration: const Duration(milliseconds: 350),
                  curve: Curves.easeOutBack,
                  scale: openMenu ? 1.0 : 0.0,
                  child: IgnorePointer(
                    ignoring: !openMenu,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {});
                      },
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset(
                            AppTheme.plateIcon,
                            width: itemSize,
                            height: itemSize,
                          ),
                          Icon(
                            Icons.restaurant_menu,
                            color: AppTheme.primaryColor,
                            size: itemSize * 0.5,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),

            AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOutBack,
              bottom: openMenu ? bottomPadding + (mainSize - itemSize) / 2 : bottomPadding + (mainSize - itemSize) / 2,
              right: openMenu ? 10.0 : closedLeftRight,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 200),
                opacity: openMenu ? 1.0 : 0.0,
                child: AnimatedScale(
                  duration: const Duration(milliseconds: 350),
                  curve: Curves.easeOutBack,
                  scale: openMenu ? 1.0 : 0.0,
                  child: IgnorePointer(
                    ignoring: !openMenu,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {});
                      },
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset(
                            AppTheme.plateIcon,
                            width: itemSize,
                            height: itemSize,
                          ),
                          Icon(
                            Icons.shopping_cart,
                            color: AppTheme.accentColor,
                            size: itemSize * 0.5,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // --- BOTÓN SUPERIOR: LOGOUT (Se desplaza hacia arriba) ---
            AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOutBack,
              bottom: openMenu ? bottomPadding + mainSize + 15 : bottomPadding + (mainSize - itemSize) / 2,
              left: openMenu ? openCenterLeft : closedLeftRight,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 200),
                opacity: openMenu ? 1.0 : 0.0,
                child: AnimatedScale(
                  duration: const Duration(milliseconds: 350),
                  curve: Curves.easeOutBack,
                  scale: openMenu ? 1.0 : 0.0,
                  child: IgnorePointer(
                    ignoring: !openMenu,
                    child: GestureDetector(
                      onTap: () async {
                        // Cerrar sesión en Supabase y volver al login
                        await Supabase.instance.client.auth.signOut();
                        if (mounted) {
                          GlobalHelper.navigateToPageRemove(context, '/login');
                        }
                      },
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset(
                            AppTheme.plateIcon,
                            width: itemSize,
                            height: itemSize,
                          ),
                          Icon(
                            Icons.logout,
                            color: AppTheme.error,
                            size: itemSize * 0.5,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // --- BOTÓN PRINCIPAL (El plato central que activa todo) ---
            AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              bottom: bottomPadding,
              left: openMenu ? (220.0 - mainSize) / 2 : 0,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    openMenu = !openMenu;
                  });
                },
                child: Spin(
                  animate: openMenu,
                  duration: const Duration(milliseconds: 800),
                  child: Image.asset(
                    AppTheme.plateIcon,
                    width: mainSize,
                    height: mainSize,
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