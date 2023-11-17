import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  static ThemeData defaults() {
    const mainFontFamily = 'Roboto';

    return ThemeData(
      scaffoldBackgroundColor: AppColors.background,
      textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontFamily: mainFontFamily,
            color: AppColors.titleColor,
            fontWeight: FontWeight.w600,
            fontStyle: FontStyle.normal,
            fontSize: 25,
          ),
          titleMedium: TextStyle(
            fontFamily: mainFontFamily,
            color: AppColors.titleColor,
            fontWeight: FontWeight.w600,
            fontStyle: FontStyle.normal,
            fontSize: 20,
          ),
          titleSmall: TextStyle(
            fontFamily: mainFontFamily,
            color: AppColors.titleColor,
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
            fontSize: 16,
          ),
          bodyLarge: TextStyle(
            fontFamily: mainFontFamily,
            color: AppColors.infoColor,
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
            fontSize: 14,
          ),
          bodyMedium: TextStyle(
            fontFamily: mainFontFamily,
            color: AppColors.infoColor,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            fontSize: 14,
          ),

          //connection error message
          bodySmall: TextStyle(
            fontFamily: mainFontFamily,
            color: AppColors.colorBlueText,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            fontSize: 14,
          ),

          //text blue button
          labelLarge: TextStyle(
            fontFamily: mainFontFamily,
            color: AppColors.textColorBlueButton,
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
            fontSize: 14,
          ),

          //text light button
          labelMedium: TextStyle(
            fontFamily: mainFontFamily,
            color: AppColors.textColorLightButton,
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
            fontSize: 14,
          ),

          // text search textfield
          labelSmall: TextStyle(
            fontFamily: mainFontFamily,
            color: AppColors.searchTextColor,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            fontSize: 20,
          )),
    );
  }
}
