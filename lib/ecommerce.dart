import 'package:ecommerce/bloc_providers.dart';
import 'package:ecommerce/core/routes/app_routes.dart';
import 'package:ecommerce/services/navigation/navigation.dart';
import 'package:ecommerce/shared/functions/general_functions.dart';
import 'package:ecommerce/shared/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/resources/strings.dart';
import 'core/routes/route_mapper.dart';

class ECommerceApp extends StatelessWidget {
  const ECommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      useInheritedMediaQuery: true,
      builder: (context, _) {
        return GestureDetector(
          onTap: GeneralFunctions.hideKeyboard,
          child: MultiBlocProvider(
            providers: blocProviders,
            child: MaterialApp(
              navigatorKey: AppRouter.navigatorKey,
              theme: AppThemes.whiteTheme,
              title: AppStrings.appName,
              debugShowCheckedModeBanner: false,
              initialRoute: AppRoutes.home,
              routes: routeMapper,
            ),
          ),
        );
      },
    );
  }
}
