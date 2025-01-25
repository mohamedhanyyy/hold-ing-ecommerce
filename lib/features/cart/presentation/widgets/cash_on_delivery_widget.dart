import 'package:ecommerce/core/resources/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/resources/colors.dart';
import '../../../../core/resources/icons.dart';
import '../../../../core/resources/strings.dart';

class CashOnDeliveryWidget extends StatelessWidget {
  const CashOnDeliveryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.sp),
      height: 50.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: AppColors.lightGrey,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            AppStrings.cashOnDelivery,
            style: blackTextW400Font11,
          ),
          SvgPicture.asset(AppIcons.check)
        ],
      ),
    );
  }
}
