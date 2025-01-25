import 'package:ecommerce/shared/widgets/custom_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/resources/colors.dart';
import '../../core/resources/styles.dart';

class CustomElevatedButton extends StatelessWidget {
  final String? buttonText;
  final Function onTap;

  const CustomElevatedButton({
    super.key,
    required this.onTap,
    this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onTap();
      },
      style: ElevatedButton.styleFrom(
        minimumSize: Size.fromHeight(68.h),
        elevation: 0,
        backgroundColor: AppColors.purple,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
      ),
      child: Text(buttonText!,
          textAlign: TextAlign.center, style: buttonTextStyle),
    );
  }
}

class CustomLoadingButtonWidget extends StatelessWidget {
  const CustomLoadingButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          minimumSize: Size.fromHeight(68.h),
          elevation: 0,
          backgroundColor: AppColors.purple,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
        ),
        child: CustomLoadingWidget());
  }
}
