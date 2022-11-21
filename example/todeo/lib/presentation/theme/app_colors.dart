import 'package:flutter/material.dart';

AppThemeColors useAppThemeColors() {
  return ThemeColors();
}

class AppColors {
  static const primary10 = Color(0xFFECF9F7);
  static const primary20 = Color(0xFFC5EDE6);
  static const primary30 = Color(0xFF9EE0D5);
  static const primary40 = Color(0xFF77D4C5);
  static const primary50 = Color(0xFF51C8B4);
  static const primary60 = Color(0xFF37AE9A);
  static const primary70 = Color(0xFF2B8878);
  static const primary80 = Color(0xFF1F6156);
  static const primary90 = Color(0xFF123A33);

  static const secondary10 = Color(0xFFAFDCFF);
  static const secondary20 = Color(0xFF71B6ED);
  static const secondary30 = Color(0xFF4C96D0);
  static const secondary40 = Color(0xFF3879AD);
  static const secondary50 = Color(0xFF306490);
  static const secondary60 = Color(0xFF244D71);
  static const secondary70 = Color(0xFF214766);
  static const secondary80 = Color(0xFF112E46);
  static const secondary90 = Color(0xFF060D13);

  static const accentMain400 = Color(0xFFFFA65F);
  static const accentLight100 = Color(0xFFFFF1E5);
  static const accentLight200 = Color(0xFFFFD4B3);

  static const grey10 = Color(0xFFFAFAFC);
  static const grey20 = Color(0xFFF5F5F7);
  static const grey30 = Color(0xFFEEEEF0);
  static const grey40 = Color(0xFFE1E1E3);
  static const grey50 = Color(0xFFBEBEC0);
  static const grey60 = Color(0xFF9F9FA1);
  static const grey70 = Color(0xFF767678);
  static const grey80 = Color(0xFF626263);
  static const grey90 = Color(0xFF242424);
  static const grey100 = Color(0xFF222223);

  static const white = Color(0xFFFFFFFF);
  static const black = Color(0xFF000000);

  static const feedbackSuccess = Color(0xFF51C8B4);
  static const feedbackError = Color(0xFFF25A43);
  static const feedbackErrorDark = Color(0xFFFF735E);
  static const feedbackWarning = Color(0xFFFFDC60);

  static const additionalBlue = Color(0xFFC9E9F5);
  static const additionalRed = Color(0xFFFFEBE8);
  static const additionalBackground = Color(0xFFE8EDF0);

  static const inputFieldBackground = Color(0xFFE0E0E0);
  static const transparent = Color(0x00FFFFFF);
  static const dialogBarrierColor = 0x8A000000;

  // General
  static const backgroundError = additionalRed;
  static const textError = feedbackError;
  static const appBarBackground = white;
  static const lightShadow = Color(0x2D767678);

  // Light mode
  static const backgroundLight = white;

  static const textLight = black;
  static const disableTextLight = grey50;

  // Dark mode
  static const backgroundDark = black;

  static const textDark = white;
  static const disableTextDark = grey50;
}

abstract class AppThemeColors {
  Color get text;

  Color get appBackground;

  Color get appBarBackground;

  Color get buttonIconColor;

  Color get smallButtonColor;

  Color get primaryButtonFill;

  Color get primaryButtonText;

  Color get primaryButtonDisabledFill;

  Color get inputFieldFill;

  Color get inputFieldBorder;

  Color get inputFieldText;

  Color get taskCardBackground;

  Color get textError;

  Color get iconColor;
}

class ThemeColors implements AppThemeColors {
  @override
  Color get text => AppColors.textLight;

  @override
  Color get appBackground => AppColors.backgroundLight;

  @override
  Color get appBarBackground => AppColors.backgroundLight;

  @override
  Color get buttonIconColor => AppColors.black;

  @override
  Color get smallButtonColor => AppColors.primary50;

  @override
  Color get primaryButtonFill => AppColors.secondary70;

  @override
  Color get primaryButtonText => AppColors.white;

  @override
  Color get primaryButtonDisabledFill => AppColors.grey40;

  @override
  Color get inputFieldFill => AppColors.white;

  @override
  Color get inputFieldBorder => AppColors.grey40;

  @override
  Color get inputFieldText => AppColors.grey70;

  @override
  Color get taskCardBackground => AppColors.secondary30;

  @override
  Color get textError => AppColors.textError;

  @override
  Color get iconColor => AppColors.white;
}
