import 'package:ecommerce/ecommerce.dart';
import 'package:ecommerce/shared/functions/general_functions.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import 'core/const/app_consts.dart';
import 'core/locator/service_locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox(AppConstants.hiveBox);
  setupLocator();
  GeneralFunctions.setPreferredOrientation();
  runApp(ECommerceApp());
}
