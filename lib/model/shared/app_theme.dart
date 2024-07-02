import 'package:flutter/material.dart';

import 'colors_theme.dart';


class Themes{
  static ThemeData lightTheme = ThemeData(
      colorScheme:const  ColorScheme.light(
          primary: AppTheme.primaryColor,
          secondary: AppTheme.primaryColor
      ),
      iconTheme: const IconThemeData(
        color: AppTheme.blueLightGP,
      ),
      buttonTheme: const ButtonThemeData(
          buttonColor: AppTheme.kPrimaryColor
      ),
      scaffoldBackgroundColor: AppTheme.kPrimaryColor,
      // appBarTheme: const AppBarTheme(
      //   backgroundColor: AppTheme.gray2,
      //   systemOverlayStyle: SystemUiOverlayStyle(
      //     statusBarColor: AppTheme.primaryColor
      //   ),
      // ),

      toggleButtonsTheme: const ToggleButtonsThemeData(
        selectedBorderColor: Colors.transparent,
        borderColor: AppTheme.kPrimaryColor,
        fillColor: AppTheme.blueLightGP,
      ),

      checkboxTheme: CheckboxThemeData(
        checkColor: WidgetStateProperty.all(AppTheme.grayGP),
        fillColor: WidgetStateProperty.all(AppTheme.blueButtonGP),
      ),

      drawerTheme: const DrawerThemeData(
        backgroundColor:  AppTheme.primaryColor,
      ),

      sliderTheme: const SliderThemeData(
          inactiveTickMarkColor: Colors.transparent ,
          activeTrackColor: AppTheme.primaryColor
      )
  );

  static ThemeData darkTheme = ThemeData(
      colorScheme:const  ColorScheme.light(
        primary: AppTheme.primaryColor,
        secondary: AppTheme.secondColor,
      ),
      iconTheme: const IconThemeData(
        color: AppTheme.gray,
      ),
      buttonTheme: const ButtonThemeData(
          buttonColor: AppTheme.black
      ),
      scaffoldBackgroundColor: AppTheme.secondColor,
      // appBarTheme: const AppBarTheme(
      //   backgroundColor: AppTheme.gray,
      //   systemOverlayStyle: SystemUiOverlayStyle(
      //       statusBarColor: AppTheme.gray
      //   ),
      // ),

      toggleButtonsTheme: const ToggleButtonsThemeData(
        selectedBorderColor: Colors.transparent,
        borderColor: AppTheme.kPrimaryColor,
        fillColor: AppTheme.blueLightGP,
      ),

      checkboxTheme: CheckboxThemeData(
        checkColor: WidgetStateProperty.all(AppTheme.grayGP),
        fillColor: WidgetStateProperty.all(AppTheme.blueButtonGP),
      ),
      drawerTheme: const DrawerThemeData(
        backgroundColor:  AppTheme.primaryColor,
      ),
      sliderTheme: const SliderThemeData(
          inactiveTickMarkColor: Colors.transparent ,
          activeTrackColor: AppTheme.primaryColor
      )
  );
}