import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:troodking_app/env/theme/app_theme.dart';
import 'package:troodking_app/shared/providers/functional_provider.dart';

class LayoutWidget extends StatefulWidget {
  const LayoutWidget({super.key, required this.child});

  final Widget child;

  @override
  State<LayoutWidget> createState() => _LayoutWidgetState();
}

class _LayoutWidgetState extends State<LayoutWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.white,
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: PopScope(
                  canPop: false,
                  onPopInvokedWithResult: (bool didPop, result) {
                    final fp = Provider.of<FunctionalProvider>(
                      context,
                      listen: false,
                    );
                    if (didPop) {
                      return;
                    } else {
                      if (fp.alerts.isEmpty && fp.pages.isEmpty) {
                        debugPrint('abre la alerta');
                        // modalSessionClose();
                      } else {
                        debugPrint(
                          'ya no abras una alerta porque ya hay una abierta',
                        );
                      }
                    }
                  },
                  child: widget.child,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
