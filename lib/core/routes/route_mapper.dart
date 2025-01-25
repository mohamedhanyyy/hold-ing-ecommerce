
import 'package:ecommerce/features/cart/presentation/screens/order_confirmed_screen.dart';
import 'package:ecommerce/features/home/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';

import '../../features/cart/presentation/screens/cart_screen.dart';
import 'app_routes.dart';

final Map<String, WidgetBuilder> routeMapper = {
  //User Route Mapper
  AppRoutes.cart: (context) => const CartScreen(),
  AppRoutes.home: (context) => const HomeScreen(),
  AppRoutes.checkout: (context) => const OrderConfirmedScreen(),

};
