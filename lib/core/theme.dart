import 'package:flutter/material.dart';
import 'package:webwork_task/core/constants/colors.dart';

const appScheme = ColorScheme(
  error: Colors.red,
  onPrimary: Colors.white,
  onSecondary: Colors.black,
  onSurface: Colors.black,
  onError: Colors.white,
  brightness: Brightness.light,
  primary: AppColors.primaryColor,
  secondary: AppColors.secondaryColor,
  surface: Colors.black,
);
final appTheme = ThemeData(
  colorScheme: appScheme,
  fontFamily: 'Avenir',
  useMaterial3: false,
);
