import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:troodking_app/env/theme/app_theme.dart';
import 'package:troodking_app/shared/helpers/responsive.dart';
import 'package:troodking_app/shared/providers/functional_provider.dart';
import 'package:troodking_app/shared/widgets/empty_data_message_widget.dart';
import 'package:troodking_app/shared/widgets/text.dart';
import 'package:troodking_app/shared/widgets/title.dart';

class HomeResumeWidget extends StatefulWidget {
  const HomeResumeWidget({super.key});

  @override
  State<HomeResumeWidget> createState() => _HomeResumeWidgetState();
}

class _HomeResumeWidgetState extends State<HomeResumeWidget> {
  final CarouselSliderController _controller = CarouselSliderController();
  int currentStep = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    return Consumer<FunctionalProvider>(
      builder: (context, fp, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TitleWidget(
              title: 'Resúmen',
              fontSize: responsive.dp(2.3),
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: responsive.hp(2)),
            fp.troodkingModel.isNotEmpty
                ? Column(
                    children: [
                      CarouselSlider(
                        options: CarouselOptions(
                          height: 200.0,
                          onPageChanged: (index, reason) {
                            currentStep = index;
                            setState(() {});
                          },
                          viewportFraction: 1,
                          autoPlay: true,
                          autoPlayInterval: const Duration(milliseconds: 4000),
                          enlargeCenterPage: true,
                        ),
                        items: [1, 2, 3, 4, 5].map((i) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Container(
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.symmetric(horizontal: 5.0),
                                decoration: BoxDecoration(color: Colors.amber),
                              );
                            },
                          );
                        }).toList(),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [1, 2, 3, 4, 5].asMap().entries.map((entry) {
                          return GestureDetector(
                            onTap: () => _controller.animateToPage(entry.key),
                            child: Container(
                              width: 12.0,
                              height: 12.0,
                              margin: EdgeInsets.symmetric(
                                vertical: 8.0,
                                horizontal: 4.0,
                              ),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: (Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black)
                                        .withValues(
                                          alpha: currentStep == entry.key
                                              ? 0.9
                                              : 0.4,
                                        ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  )
                : EmptyDataMessageWidget(
                    message: 'Crea una categoría e ingresa un producto',
                  ),
          ],
        );
      },
    );
  }
}
