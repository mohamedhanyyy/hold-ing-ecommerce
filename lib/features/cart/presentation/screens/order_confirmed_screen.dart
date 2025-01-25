import 'package:ecommerce/core/resources/colors.dart';
import 'package:ecommerce/core/resources/images.dart';
import 'package:ecommerce/core/resources/styles.dart';
import 'package:ecommerce/shared/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/strings.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../services/navigation/navigation.dart';
import '../../../../shared/widgets/custom_snack_bar.dart';

class OrderConfirmedScreen extends StatelessWidget {
  const OrderConfirmedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 200),
              SizedBox(
                height: 400,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(AppImages.mobile),
                    Image.asset(AppImages.mask,
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width,
                        color: AppColors.primaryColor),
                  ],
                ),
              ),
              Center(child: Text(AppStrings.orderConfirmed, style: bigTitle)),
              SizedBox(height: 10),
              Text(
                AppStrings.yourOrderHasBeenConfirmed,
                textAlign: TextAlign.center,
                style: greyTextW400Font15,
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomElevatedButton(
        onTap: () {
          CustomSnackBars.showSuccessToast(title: AppStrings.thanksForShopping);

          AppRouter.goAndRemoveAll(AppRoutes.home);
        },
        buttonText: AppStrings.continueShopping,
      ),
    );
  }
}
