import 'dart:ui';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:troodking_app/env/theme/app_theme.dart';
import 'package:troodking_app/shared/helpers/responsive.dart';
import 'package:troodking_app/shared/models/button_type_enum.dart';
import 'package:troodking_app/shared/providers/functional_provider.dart';
import 'package:troodking_app/shared/widgets/filled_button_widget.dart';
import 'package:troodking_app/shared/widgets/text_button_widget.dart';
import 'package:troodking_app/shared/widgets/text_form_field_widget.dart';
import 'package:troodking_app/shared/widgets/title.dart';

class AlertGeneric extends StatefulWidget {
  final bool dismissable;
  final GlobalKey? keyToClose;
  final Widget content;
  final bool? heightOption;

  const AlertGeneric({
    super.key,
    required this.content,
    this.heightOption = false,
    this.dismissable = false,
    this.keyToClose,
  });

  @override
  State<AlertGeneric> createState() => _AlertGenericState();
}

class _AlertGenericState extends State<AlertGeneric> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final responsive = Responsive(context);
    return Stack(
      children: [
        Container(
            padding: EdgeInsets.all(responsive.isTablet ? responsive.hp(2) : 15),
            width: responsive.isTablet ? responsive.wp(75) : double.infinity,
            height: widget.heightOption == true ? size.height * 0.54 : null,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: AppTheme.white),
            child: Material(
                type: MaterialType.transparency, child: widget.content)),
        if (widget.dismissable)
          Positioned(
            top: -3,
            right: 0,
            child: SizedBox(
                height: 50,
                width: 50,
                child: IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    final fp =
                        Provider.of<FunctionalProvider>(context, listen: false);
                    fp.dismissAlert(key: widget.keyToClose!);
                  },
                )),
          ),
      ],
    );
  }
}

class AlertTemplate extends StatefulWidget {
  final Widget content;
  final GlobalKey keyToClose;
  final bool? dismissAlert;
  final bool? animation;
  final double? padding;

  const AlertTemplate(
      {super.key,
      required this.content,
      required this.keyToClose,
      this.dismissAlert = false,
      this.animation = true,
      this.padding = 20});

  @override
  State<AlertTemplate> createState() => _AlertTemplateState();
}

class _AlertTemplateState extends State<AlertTemplate> {
  late GlobalKey keySummoner;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ZoomOut(
        animate: false,
        duration: const Duration(milliseconds: 200),
        child: Scaffold(
        backgroundColor: Colors.black45.withValues(alpha: 0.2),
          body: Stack(
            children: [
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                child: Container(color: Colors.black.withValues(alpha: 0.2)),
              ),
              GestureDetector(
                onTap: () {
                  final fp =
                      Provider.of<FunctionalProvider>(context, listen: false);
                  widget.dismissAlert == true
                      ? fp.dismissAlert(key: widget.keyToClose)
                      : null;
                },
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.transparent,
                ),
              ),
              Container(
                padding: EdgeInsets.all(widget.padding ?? 20),
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        widget.animation == true
                            ? FadeInUpBig(
                                animate: true,
                                controller: (controller) {},
                                duration: const Duration(milliseconds: 300),
                                child: widget.content)
                            : widget.content,
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

class AlertAddCategorieWidget extends StatefulWidget {
  const AlertAddCategorieWidget({super.key, required this.confirm, required this.keyToClose});
  
  final GlobalKey keyToClose;
  final void Function() confirm;


  @override
  State<AlertAddCategorieWidget> createState() => _AlertAddCategorieWidgetState();
}

class _AlertAddCategorieWidgetState extends State<AlertAddCategorieWidget> {

  final List<String> foodEmojis = [
    '🍎', '🍐', '🍊', '🍋',
    '🍇','🍓','🫐','🍈','🍒','🍑','🥭',
    '🍍','🥥','🍅','🍆','🥑','🥦',
    '🥬', '🥒', '🌽', '🥕','🍝' , '🧄', '🧅',
    '🥔', '🍠', '🍞', '🥖',
    '🧀',
    '🥚',
    '🧈',
    '🧇',
    '🥓',
    '🥩',
    '🍗',
    '🌭',
    '🍕',
    '🫓',
    '🥪',
    '🥙',
    '🧆',
    '🌮',
    '🥗',
    '🥘',
    '🫕',
    '🥣',
    '🍝',
    '🍜',
    '🍲',
    '🍛',
    '🍣',
    '🍱',
    '🥟',
    '🦪',
    '🍤',
    '🍙',
    '🍚',
    '🍘',
    '🥠',
    '🥮',
    '🍧',
    '🍨',
    '🍦',
    '🥧',
    '🧁',
    '🍰',
    '🎂',
    '🍮',
    '🍫',
    '🍿',
    '🍩',
    '🍪',
    '🥜',
    '🥛',
    '🍾',
    '🍷',
    '🍺',
    '🧃',
  ];


  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    return Consumer<FunctionalProvider>(
      builder: (context, fp, child) {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TitleWidget(title: 'Seleccione un ícono'),
              SizedBox(
                height: responsive.hp(30),
                child: GridView.builder(
                  padding: const EdgeInsets.all(10),
                  shrinkWrap: true,
                  physics: AlwaysScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5, 
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  itemCount: foodEmojis.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () => Navigator.pop(context, foodEmojis[index]),
                      child: Center(
                        child: Text(
                          foodEmojis[index],
                          style: const TextStyle(fontSize: 42),
                        ),
                      ),
                    );
                  },
                ),
              ),
              TextFormFieldWidget(
                hintText: 'Nombre de la categoría',
              ),
          
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButtonWidget(
                    onPressed: () {
                      fp.dismissAlert(key: widget.keyToClose);
                    }, 
                    nameButton: 'Cancelar'),
                  SizedBox(width: responsive.wp(1)),
                  FilledButtonWidget(
                    typeButton: WidgetTypeEnum.confirm,
                    onPressed: widget.confirm,
                    width: responsive.wp(5),
                    height: responsive.isTablet ? responsive.hp(4) : 42,
                    borderRadius: 20,
                    text: 'Confirmar',
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
