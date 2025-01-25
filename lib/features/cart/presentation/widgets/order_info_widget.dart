import 'package:ecommerce/core/resources/styles.dart';
import 'package:flutter/material.dart';

import '../../../../core/resources/strings.dart';

class OrderInfoWidget extends StatelessWidget {
  const OrderInfoWidget({super.key, required this.subTotal});
  final double subTotal;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 20, bottom: 15),
          child: Text(
            AppStrings.orderInfo,
            style: blackTextW500Font17,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppStrings.subTotal,
              style: greyTextW400Font15,
            ),
            Text(
              '\$$subTotal',
              style: blackTextW500Font15,
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(AppStrings.shippingCost, style: greyTextW400Font15),
              Text('\$10', style: blackTextW500Font15),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(AppStrings.total, style: greyTextW400Font15),
            Text('\$${subTotal + 10}', style: blackTextW500Font15),
          ],
        ),
      ],
    );
  }
}
