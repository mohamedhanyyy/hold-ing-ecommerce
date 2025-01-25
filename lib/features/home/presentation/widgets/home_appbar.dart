import 'package:ecommerce/services/navigation/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/resources/icons.dart';
import '../../../../core/resources/images.dart';
import '../../../../core/routes/app_routes.dart';

class HomeAppbar extends StatelessWidget {
  const HomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Image.asset(AppImages.logo),
      centerTitle: true,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: GestureDetector(
            onTap: () {
              AppRouter.goRoute(AppRoutes.cart);
            },

            child: CircleAvatar(
              backgroundColor: Colors.grey[200],
              child: SvgPicture.asset(AppIcons.bag),
            ),
          ),
        ),
      ],
    );
  }
}
