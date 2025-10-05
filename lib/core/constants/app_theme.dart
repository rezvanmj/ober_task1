import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_colors.dart';
import 'app_dimensions.dart';
import 'app_styles.dart';
import 'app_values.dart';

final ThemeData appLightThemeData = ThemeData(
  splashFactory: NoSplash.splashFactory,
  highlightColor: Colors.transparent,
  hoverColor: Colors.transparent,
  fontFamily: AppValues.poppinsFont,

  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.tertiaryColor,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: AppColors.secondaryColor),
    foregroundColor: AppColors.textColor,
    titleTextStyle: AppStyles.bodyLarge.copyWith(color: AppColors.primaryColor),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: AppColors.cardColor,
      statusBarIconBrightness: Brightness.dark,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
        if (states.contains(WidgetState.disabled)) {
          return AppColors.shadowColor;
        }
        return AppColors.primaryColor;
      }),
      foregroundColor: WidgetStateProperty.resolveWith<Color>((states) {
        if (states.contains(WidgetState.disabled)) {
          return AppColors.secondaryTextColor;
        } else {
          return AppColors.onPrimaryColor;
        }
      }),
      textStyle: WidgetStateProperty.resolveWith<TextStyle>((states) {
        if (states.contains(WidgetState.disabled)) {
          return AppStyles.titleMedium.copyWith(
            color: AppColors.onPrimaryColor,
          );
        } else {
          return AppStyles.titleMedium.copyWith(
            color: AppColors.onPrimaryColor,
          );
        }
      }),
      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimensions.buttonRadius),
        ),
      ),
    ),
  ),

  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      overlayColor: WidgetStateProperty.all(Colors.transparent),

      foregroundColor: WidgetStateProperty.resolveWith<Color>((
        Set<WidgetState> states,
      ) {
        if (states.contains(WidgetState.disabled)) {
          return AppColors.shadowColor;
        }
        return AppColors.primaryColor;
      }),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppDimensions.buttonRadius),
      borderSide: BorderSide(color: AppColors.primaryColor, width: 1),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(color: AppColors.primaryColor, width: 1),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(color: AppColors.primaryColor, width: 1),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(color: AppColors.primaryColor, width: 1),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(color: AppColors.primaryColor, width: 1),
    ),

    hintStyle: AppStyles.bodyMedium.copyWith(color: AppColors.shadowColor),
    labelStyle: AppStyles.bodyMedium.copyWith(color: AppColors.shadowColor),
    floatingLabelStyle: AppStyles.bodyMedium.copyWith(
      color: AppColors.primaryColor,
    ),
  ),
  disabledColor: AppColors.disableColor,
  dividerColor: AppColors.shadowColor,
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: AppColors.backgroundColor,
    selectedItemColor: AppColors.primaryColor,
  ),
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: AppColors.textColor,
  ),
  unselectedWidgetColor: AppColors.shadowColor,
  primaryColor: AppColors.primaryColor,
  primaryColorDark: Colors.black,
  secondaryHeaderColor: AppColors.primaryColor,
  scaffoldBackgroundColor: AppColors.backgroundColor,
  cardColor: AppColors.cardColor,
  shadowColor: AppColors.shadowColor,
  splashColor: AppColors.tertiaryColor,
  // highlightColor: AppColors.highlightColor,
  iconTheme: const IconThemeData(color: AppColors.iconColor),
  buttonTheme: const ButtonThemeData(
    colorScheme: ColorScheme.light(
      surface: AppColors.primaryColor,
      onSurface: AppColors.onPrimaryColor,
      onPrimary: AppColors.onPrimaryColor,
    ),
  ),

  textTheme: TextTheme(
    displayLarge: AppStyles.displayLarge,
    displayMedium: AppStyles.displayMedium,
    displaySmall: AppStyles.displaySmall,
    headlineMedium: AppStyles.headlineMedium,
    headlineSmall: AppStyles.headlineSmall,
    headlineLarge: AppStyles.headlineLarge,
    titleLarge: AppStyles.titleLarge,
    titleMedium: AppStyles.titleMedium,
    titleSmall: AppStyles.titleSmall,
    bodyLarge: AppStyles.bodyLarge,
    bodyMedium: AppStyles.bodyMedium,
    bodySmall: AppStyles.bodySmall,
    labelLarge: AppStyles.labelLarge,
    labelSmall: AppStyles.labelSmall,
  ),
  colorScheme: ColorScheme.light(
    tertiary: AppColors.tertiaryColor,
    primary: AppColors.primaryColor,
    onPrimary: AppColors.onPrimaryColor,
    secondary: AppColors.secondaryColor,
    onSecondary: AppColors.onSecondaryColor,
    error: AppColors.errorColor,
    onError: AppColors.errorColor,
    secondaryContainer: AppColors.secondaryColor,
    outline: AppColors.iconColor,
  ),
  extensions: <ThemeExtension<dynamic>>[
    CustomColors(
      success: AppColors.successColor,
      secondaryTextColor: AppColors.secondaryTextColor,
    ),
  ],

  cardTheme: CardThemeData(color: AppColors.cardColor, elevation: 3),
  checkboxTheme: CheckboxThemeData(
    fillColor: WidgetStateProperty.resolveWith<Color>((states) {
      if (states.contains(WidgetState.selected)) {
        return AppColors.primaryColor;
      }
      return Colors.transparent;
    }),
    checkColor: WidgetStateProperty.resolveWith<Color>((states) {
      return AppColors.primaryColor;
    }),
    side: const BorderSide(color: AppColors.secondaryColor, width: 1.0),
  ),

  chipTheme: ChipThemeData(
    backgroundColor: AppColors.backgroundColor,
    selectedColor: AppColors.primaryColor,
    padding: EdgeInsets.all(8),
    labelStyle: TextStyle(color: Colors.white),
    secondaryLabelStyle: TextStyle(color: Colors.black),
    shape: StadiumBorder(side: BorderSide(color: Colors.transparent)),
  ),
);

class CustomColors extends ThemeExtension<CustomColors> {
  CustomColors({required this.success, required this.secondaryTextColor});

  final Color? success;
  final Color? secondaryTextColor;

  @override
  CustomColors copyWith({Color? success, Color? secondaryTextColor}) {
    return CustomColors(
      success: success ?? this.success,
      secondaryTextColor: secondaryTextColor ?? this.secondaryTextColor,
    );
  }

  @override
  CustomColors lerp(CustomColors? other, double t) {
    if (other == null) return this;
    return CustomColors(
      success: Color.lerp(success, other.success, t),
      secondaryTextColor: Color.lerp(
        secondaryTextColor,
        other.secondaryTextColor,
        t,
      ),
    );
  }
}
