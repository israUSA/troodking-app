import 'dart:ui';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:troodking_app/env/theme/app_theme.dart';
import 'package:troodking_app/shared/helpers/responsive.dart';
import 'package:troodking_app/shared/models/button_type_enum.dart';
import 'package:troodking_app/shared/models/troodking_model.dart';
import 'package:troodking_app/shared/providers/functional_provider.dart';
import 'package:troodking_app/shared/services/objectbox_service.dart';
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
            borderRadius: BorderRadius.circular(20),
            color: AppTheme.white,
          ),
          child: Material(
            type: MaterialType.transparency,
            child: widget.content,
          ),
        ),
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
                  final fp = Provider.of<FunctionalProvider>(
                    context,
                    listen: false,
                  );
                  fp.dismissAlert(key: widget.keyToClose!);
                },
              ),
            ),
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

  const AlertTemplate({
    super.key,
    required this.content,
    required this.keyToClose,
    this.dismissAlert = false,
    this.animation = true,
    this.padding = 20,
  });

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
                final fp = Provider.of<FunctionalProvider>(
                  context,
                  listen: false,
                );
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
                              child: widget.content,
                            )
                          : widget.content,
                    ],
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

class AlertAddCategorieWidget extends StatefulWidget {
  const AlertAddCategorieWidget({super.key, required this.keyToClose});

  final GlobalKey keyToClose;

  @override
  State<AlertAddCategorieWidget> createState() =>
      _AlertAddCategorieWidgetState();
}

class _AlertAddCategorieWidgetState extends State<AlertAddCategorieWidget> {
  TroodkingModel troodking = TroodkingModel();
  String categoryIcon = '';
  final TextEditingController nameController = TextEditingController();
  final List<String> foodEmojis = [
    '🍎',
    '🍐',
    '🍊',
    '🍋',
    '🍇',
    '🍓',
    '🫐',
    '🍈',
    '🍒',
    '🍑',
    '🥭',
    '🍍',
    '🥥',
    '🍅',
    '🍆',
    '🥑',
    '🥦',
    '🥬',
    '🥒',
    '🌽',
    '🥕',
    '🍝',
    '🧄',
    '🧅',
    '🥔',
    '🍠',
    '🍞',
    '🥖',
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
  void initState() {
    super.initState();
  }

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
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,
                  ),
                  itemCount: foodEmojis.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        categoryIcon = foodEmojis[index];
                        setState(() {});
                      },
                      child: Center(
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: categoryIcon == foodEmojis[index]
                                ? AppTheme.cautionCard
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            foodEmojis[index],
                            style: const TextStyle(fontSize: 42),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: responsive.hp(1)),

              TextFormFieldWidget(
                controller: nameController,
                hintText: 'Nombre de la categoría',
                onChanged: (p0) => setState(() {}),
              ),

              SizedBox(height: responsive.hp(1)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButtonWidget(
                    onPressed: () {
                      fp.dismissAlert(key: widget.keyToClose);
                    },
                    nameButton: 'Cancelar',
                  ),
                  SizedBox(width: responsive.wp(1)),
                  FilledButtonWidget(
                    typeButton:
                        categoryIcon.isNotEmpty && nameController.text.isNotEmpty
                        ? WidgetTypeEnum.confirm
                        : WidgetTypeEnum.disable,
                    text: 'Confirmar',
                    borderRadius: 10,
                    onPressed:
                        categoryIcon.isNotEmpty && nameController.text.isNotEmpty
                        ? () {
                            troodking.categorieIcon = categoryIcon;
                            troodking.categorieName = nameController.text;
                            ObjectboxService.instance.createCategory(troodking);
                            fp.dismissAlert(key: widget.keyToClose);
                            setState(() {});
                          }
                        : null,
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

class AlertDeleteCategorieWidget extends StatefulWidget {
  const AlertDeleteCategorieWidget({
    super.key,
    required this.keyToClose,
    required this.confirm,
  });

  final GlobalKey keyToClose;
  final void Function() confirm;

  @override
  State<AlertDeleteCategorieWidget> createState() =>
      _AlertDeleteCategorieWidgetState();
}

class _AlertDeleteCategorieWidgetState
    extends State<AlertDeleteCategorieWidget> {
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    return Consumer<FunctionalProvider>(
      builder: (context, fp, child) {
        return Column(
          children: [
            RichText(
              text: TextSpan(
                style: TextStyle(
                  fontSize: responsive.dp(2.1),
                  color: AppTheme.black,
                ),
                children: [
                  TextSpan(text: '¿Desea '),
                  TextSpan(
                    text: ' eliminar ',
                    style: TextStyle(
                      color: AppTheme.error,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(text: 'esta categoría?'),
                ],
              ),
            ),

            SizedBox(height: responsive.hp(1)),

            Text(
              'Se eliminaran todos los alimentos de esta categoría',
              style: TextStyle(fontSize: responsive.dp(1.8)),
              textAlign: TextAlign.center,
            ),

            SizedBox(height: responsive.hp(2)),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButtonWidget(
                  nameButton: 'Cancelar',
                  onPressed: () {
                    fp.dismissAlert(key: widget.keyToClose);
                  },
                ),
                SizedBox(width: responsive.wp(1)),
                FilledButtonWidget(
                  typeButton: WidgetTypeEnum.cancel,
                  onPressed: widget.confirm,
                  borderRadius: 10,
                  text: 'Eliminar',
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
