import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:todeo/exports.dart';
import 'package:todeo/presentation/theme/app_typography.dart';

class ErrorMessage extends HookWidget {
  const ErrorMessage({super.key});

  @override
  Widget build(BuildContext context) {
    final typography = useAppTypography();

    return Text(
      LocaleKeys.error_something_is_wrong.tr(),
      style: typography.errorText,
    );
  }
}
