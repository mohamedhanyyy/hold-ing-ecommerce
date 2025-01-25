import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/resources/colors.dart';

class AppThemes {
  static ThemeData whiteTheme = ThemeData(
    hintColor: AppColors.primaryColor,
    fontFamily: 'Inter_18pt',
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.scaffoldColor,
    splashColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(size: 13.sp, color: AppColors.blackText),
      backgroundColor: AppColors.scaffoldColor,
      titleSpacing: 0,
      elevation: 0,
    ),
  );
}
