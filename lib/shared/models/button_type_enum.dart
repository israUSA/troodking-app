import 'package:flutter/material.dart';
import 'package:troodking_app/env/theme/app_theme.dart';

enum WidgetTypeEnum {
  normal,
  confirm,
  sucess,
  warning,
  cancel
}

extension ButtonTypeColor on WidgetTypeEnum {
  Color get colorButton {
    switch (this) {
      case WidgetTypeEnum.normal:
        return AppTheme.textSecondary;
      case WidgetTypeEnum.confirm:
        return AppTheme.confirmCardSoft;
      case WidgetTypeEnum.sucess:
        return AppTheme.sucessBorder;
      case WidgetTypeEnum.warning:
        return AppTheme.cautionCardSoft;
      case WidgetTypeEnum.cancel:
        return AppTheme.error;
    }
  }

  Color get colorTextButton {
    switch (this) {
      case WidgetTypeEnum.normal:
        return AppTheme.white;
      case WidgetTypeEnum.confirm:
        return AppTheme.white;
      case WidgetTypeEnum.sucess:
        return AppTheme.success;
      case WidgetTypeEnum.warning:
        return AppTheme.textColor;
      case WidgetTypeEnum.cancel:
        return AppTheme.error;
    }
  }
}
