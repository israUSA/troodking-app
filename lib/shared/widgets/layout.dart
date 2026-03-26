import 'dart:developer';

import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:troodking_app/env/environment.dart';
import 'package:troodking_app/env/theme/app_theme.dart';
import 'package:troodking_app/shared/helpers/responsive.dart';
import 'package:troodking_app/shared/providers/functional_provider.dart';
import 'package:troodking_app/shared/widgets/alert_modal.dart';
import 'package:troodking_app/shared/widgets/button_navigation_widget.dart';
import 'package:troodking_app/shared/widgets/page_modal.dart';
import 'package:troodking_app/shared/widgets/title.dart';

class LayoutWidget extends StatefulWidget {
  const LayoutWidget({super.key, required this.child, this.title, this.nameInterceptor, required this.requiredStack, this.backPageView = false,  this.keyDismiss});

  final Widget child;
  final String? title;
  final String? nameInterceptor;
  final bool requiredStack;
  final bool backPageView;
  final GlobalKey<State<StatefulWidget>>? keyDismiss;

  @override
  State<LayoutWidget> createState() => _LayoutWidgetState();
}

class _LayoutWidgetState extends State<LayoutWidget> {
  final String appName = Environment().config!.appName;

  Future<bool> _backButton(bool button, RouteInfo info) async {
    final fp = Provider.of<FunctionalProvider>(context, listen: false);
    setState(() {});
    if (widget.nameInterceptor == null) {
      if (fp.pages.isNotEmpty || (fp.pages.last.key != widget.keyDismiss)) return false;
      return true;
    } else {
      if (mounted) {
        if (button) return false;
        if (fp.alerts.isNotEmpty) {
          return false;
        }
      }
      return true;
    }
  }


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
       BackButtonInterceptor.add(_backButton,
          name: widget.nameInterceptor, context: context);
      
    },);
  }

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    return Consumer<FunctionalProvider>(
      builder: (context, fp, child) {
      return Scaffold(
          backgroundColor: AppTheme.white,
          body: Stack(
            children: [
              CustomScrollView(
                slivers: [
                  SliverAppBar(
                    forceElevated: true,
                    automaticallyImplyLeading: false,
                    pinned: true,
                    centerTitle: true,
                    floating: false,
                    backgroundColor: AppTheme.white,
                    surfaceTintColor: AppTheme.white,
                    leading: Visibility(
                      visible: widget.backPageView,
                      child: IconButton(
                        onPressed: () {
                          widget.keyDismiss != null
                          ? fp.dismissPage(key: widget.keyDismiss!)
                          : null;
                          
                        }, 
                        icon: Icon(Icons.arrow_back_ios))),
                    title: TitleWidget(
                      title: widget.title ?? appName,
                      fontSize: responsive.dp(2.5),
                      fontWeight: FontWeight.bold,
                      color: AppTheme.primaryColor,
                    ),
                  ),
        
                  SliverToBoxAdapter(
                    child: PopScope(
                      canPop: false,
                      onPopInvokedWithResult: (bool didPop, result) {
                        if (didPop) {
                          return;
                        } else {
                          if (fp.alerts.isEmpty && fp.pages.isEmpty) {
                            debugPrint('abre la alerta');
                            // modalSessionClose();
                          } else {
                            debugPrint('ya no abras una alerta porque ya hay una abierta');
                          }
                        }
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: responsive.hp(1),
                          horizontal: responsive.wp(5),
                        ),
                        child: widget.child,
                      ),
                    ),
                  ),
                ],
              ),
              const ButtonNavigationWidget(),
              if (widget.requiredStack) const PageModal(),
              if (widget.requiredStack) const AlertModal(),
            ],
          ),
        );
        
      },
    );
  }
}
