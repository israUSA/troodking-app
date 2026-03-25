import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:troodking_app/env/environment.dart';
import 'package:troodking_app/env/theme/app_theme.dart';
import 'package:troodking_app/shared/helpers/responsive.dart';
import 'package:troodking_app/shared/providers/functional_provider.dart';
import 'package:troodking_app/shared/widgets/title.dart';

class LayoutWidget extends StatefulWidget {
  const LayoutWidget({super.key, required this.child});

  final Widget child;

  @override
  State<LayoutWidget> createState() => _LayoutWidgetState();
}

class _LayoutWidgetState extends State<LayoutWidget> {
  final String appName = Environment().config!.appName;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
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
                title: TitleWidget(
                  title: appName,
                  fontSize: responsive.dp(2.5),
                  fontWeight: FontWeight.bold,
                  color: AppTheme.primaryColor,
                ),
              ),

              SliverToBoxAdapter(
                child: PopScope(
                  canPop: false,
                  onPopInvokedWithResult: (bool didPop, result) {
                    final fp = Provider.of<FunctionalProvider>(context, listen: false,);
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
        ],
      ),
    );
  }
}
