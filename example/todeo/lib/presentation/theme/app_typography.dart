import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'app_colors.dart';

const _fontFamily = 'Gilroy';

class AppTypography {
  AppTypography(this._colors);

  final AppThemeColors _colors;

  TextStyle get h1 => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 20,
        fontWeight: FontWeight.w800,
        color: _colors.text,
      );

  TextStyle get h2 => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 18,
        fontWeight: FontWeight.w700,
        color: _colors.text,
      );

  TextStyle get h3 => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: _colors.text,
      );

  TextStyle get h4 => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: _colors.text,
      );

  TextStyle get h5 => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 17,
        fontWeight: FontWeight.w600,
        color: _colors.text,
      );

  TextStyle get h6 => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 17,
        fontWeight: FontWeight.w600,
        color: _colors.text,
      );

  TextStyle get b1 => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 15,
        fontWeight: FontWeight.w400,
        color: _colors.text,
      );

  TextStyle get b2 => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: _colors.text,
      );

  TextStyle get button1 => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 15,
        fontWeight: FontWeight.w700,
        color: _colors.text,
      );

  TextStyle get button2 => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 14,
        fontWeight: FontWeight.w700,
        color: _colors.text,
      );

  TextStyle get details1 => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: _colors.text,
      );

  TextStyle get details2 => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 11,
        fontWeight: FontWeight.w400,
        color: _colors.text,
      );

  TextStyle get label1 => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: _colors.text,
      );

  TextStyle get label2 => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 11,
        fontWeight: FontWeight.w600,
        color: _colors.text,
      );

  TextStyle get smallLabel1 => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 10,
        fontWeight: FontWeight.w600,
        color: _colors.text,
      );

  TextStyle get invisible => const TextStyle(
        height: 0,
        color: AppColors.transparent,
      );

  TextStyle get errorText => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 10,
        fontWeight: FontWeight.w600,
        color: _colors.textError,
      );

  TextStyle get taskCardText => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: _colors.text,
      );

  TextStyle get buttonText => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: _colors.primaryButtonText,
      );

  TextStyle get taskCardTextDone => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 16,
        fontWeight: FontWeight.w600,
        decoration: TextDecoration.lineThrough,
        color: _colors.text,
      );
}

AppTypography useAppTypography() {
  final colors = useAppThemeColors();

  return useMemoized(() => AppTypography(colors), [colors]);
}
