import 'package:flutter/widgets.dart';

import '../helpers/responsive.dart';

class SeparateItemsWidget extends StatefulWidget {
  final double? separationValue;
  final List<Widget> children;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisAlignment mainAxisAlignment;

  const SeparateItemsWidget(
      {super.key,
      this.separationValue,
      required this.children,
      this.crossAxisAlignment = CrossAxisAlignment.start,
      this.mainAxisAlignment = MainAxisAlignment.start});

  @override
  State<SeparateItemsWidget> createState() =>
      _SeparateItemsWidgetState();
}

class _SeparateItemsWidgetState extends State<SeparateItemsWidget> {
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    return Column(
        mainAxisAlignment: widget.mainAxisAlignment,
        crossAxisAlignment: widget.crossAxisAlignment,
        children: widget.children
            .asMap()
            .map((i, el) {
              return MapEntry(
                i,
                Column(
                  children: [
                    el,
                    if (i < (widget.children.length - 1))
                      SizedBox(
                        height: widget.separationValue ?? (responsive.isTablet ? responsive.hp(2.5) : responsive.hp(1.5)),
                      ),
                    // MapEntry(i, el),
                  ],
                ),
              );
            })
            .values
            .toList());
  }
}
