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
          
          TitleWidget(title: 'Resúmen', fontSize: responsive.dp(2.3),  fontWeight: FontWeight.bold,),
          SizedBox(height: responsive.hp(2),),
          DottedBorder(
            options: RectDottedBorderOptions(
              dashPattern: [10, 5],
              strokeWidth: 3,
              color: AppTheme.carbsColor
            ),
            child: fp.troodkingModel.isNotEmpty
            ? Column(
              children: [
                TextWidget(title: 'Se agrego ${fp.troodkingModel.last.categorieName} como categoría')
      
              ],
            )
            : EmptyDataMessageWidget(message: 'Crea una categoría e ingresa un producto'),

            
          )
        ],
      );
      },
    );
  }
}