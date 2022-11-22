import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:todeo/exports.dart';
import 'package:todeo/presentation/theme/app_colors.dart';
import 'package:todeo/presentation/theme/app_dimens.dart';
import 'package:todeo/presentation/theme/app_typography.dart';
import 'package:todeo/presentation/widgets/return_arrow.dart';

class CustomAppBar extends HookWidget implements PreferredSizeWidget {
  const CustomAppBar({
    this.appBarHeight = AppDimens.c,
    this.leading = false,
    Key? key,
  }) : super(key: key);

  final double appBarHeight;
  final bool leading;

  @override
  Widget build(BuildContext context) {
    final typography = useAppTypography();
    final colors = useAppThemeColors();

    return AppBar(
      title: Text(
        LocaleKeys.app_bar_title.tr(),
        style: typography.h1,
      ),
      leading: leading ? const ReturnArrow() : null,
      backgroundColor: colors.appBarBackground,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBarHeight);
}
