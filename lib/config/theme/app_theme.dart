import 'package:flutter/material.dart';

class ThemeConfig{
  static ThemeData createTheme(){
    return ThemeData(
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Colors.transparent,
      ),
    );
  }
}