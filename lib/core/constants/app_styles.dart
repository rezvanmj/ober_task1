import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_values.dart';

class AppStyles {
  AppStyles._();

  static TextStyle displayLarge = TextStyle(
    fontFamily: AppValues.poppinsFont,
    color: AppColors.textColor,
    fontWeight: FontWeight.w300,
    fontStyle: FontStyle.normal,
    letterSpacing: 0.5,
    fontSize: 40.0,
  );

  static TextStyle displayMedium = TextStyle(
    fontFamily: AppValues.poppinsFont,
    color: AppColors.textColor,
    fontWeight: FontWeight.w300,
    fontStyle: FontStyle.normal,
    letterSpacing: 0.5,
    fontSize: 30.0,
  );

  static TextStyle displaySmall = TextStyle(
    fontFamily: AppValues.poppinsFont,
    color: AppColors.textColor,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    letterSpacing: 0.0,
    fontSize: 24.0,
  );

  static TextStyle headlineMedium = TextStyle(
    fontFamily: AppValues.poppinsFont,
    color: AppColors.textColor,
    fontWeight: FontWeight.bold,
    fontStyle: FontStyle.normal,
    // letterSpacing: 0.25,
    fontSize: 28.0,
  );

  static TextStyle headlineSmall = TextStyle(
    fontFamily: AppValues.poppinsFont,
    color: AppColors.textColor,
    fontWeight: FontWeight.bold,
    fontStyle: FontStyle.normal,
    letterSpacing: 0.0,
    fontSize: 19.0,
  );

  static TextStyle headlineLarge = TextStyle(
    fontFamily: AppValues.poppinsFont,
    color: AppColors.textColor,
    fontWeight: FontWeight.bold,
    fontStyle: FontStyle.normal,

    fontSize: 30.0,
  );

  static TextStyle titleLarge = TextStyle(
    //title large sat from figma
    fontFamily: AppValues.poppinsFont,
    color: AppColors.textColor,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,

    fontSize: 20.0,
  );

  static TextStyle titleMedium = TextStyle(
    //title medium sat from figma
    fontFamily: AppValues.poppinsFont,
    color: AppColors.textColor,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,

    fontSize: 16.0,
  );

  static TextStyle titleSmall = TextStyle(
    fontFamily: AppValues.poppinsFont,
    color: AppColors.textColor,
    fontWeight: FontWeight.w300,
    fontStyle: FontStyle.normal,
    fontSize: 14.0,
  );

  static TextStyle bodyLarge = TextStyle(
    fontFamily: AppValues.poppinsFont,
    fontWeight: FontWeight.w700,
    color: AppColors.textColor,

    fontStyle: FontStyle.normal,
    fontSize: 16.0,
  );

  static TextStyle bodyMedium = TextStyle(
    // body medium sat from figma
    fontFamily: AppValues.poppinsFont,
    color: AppColors.textColor,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,

    fontSize: 13.0,
  );

  static TextStyle labelLarge = TextStyle(
    fontFamily: AppValues.poppinsFont,
    color: AppColors.textColor,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,

    fontSize: 18.0,
  );

  static TextStyle bodySmall = TextStyle(
    //
    fontFamily: AppValues.poppinsFont,
    color: AppColors.textColor,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
    fontSize: 12.0,
  );

  static TextStyle labelSmall = TextStyle(
    fontFamily: AppValues.poppinsFont,
    color: AppColors.textColor,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
    fontSize: 10.0,
  );

  static TextStyle header = TextStyle(
    fontFamily: AppValues.poppinsFont,
    color: AppColors.textColor,
    fontWeight: FontWeight.w900,
    fontStyle: FontStyle.normal,
    fontSize: 22.0,
  );
}
