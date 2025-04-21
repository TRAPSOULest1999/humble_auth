import 'package:flutter/material.dart';

class AppColors {
  static const primary = Color(0xFF5BB896);
  static const formBackground = Color(0xFF162229);
  static const white = Colors.white;
}

class AppTextStyles {
  static const header = TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.white);
  static const label = TextStyle(color: AppColors.white);
  static const input = TextStyle(color: AppColors.white);
  static const link = TextStyle(color: AppColors.white, decoration: TextDecoration.underline);
  static const button = TextStyle(color: AppColors.white);
}