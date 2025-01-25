import 'package:ecommerce/core/extenstions/string_extension.dart';
import 'package:ecommerce/core/resources/styles.dart';
import 'package:ecommerce/features/cart/cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/resources/colors.dart';
import '../../../../core/resources/icons.dart';
import '../../../home/data/model/products_model.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget(
      {super.key, required this.product, required this.currentIndex});
  final ProductsModel product;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    final image = '${product.images!.first}'.cleanSpecialCharacters();
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      height: 120,
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                '$image',
                width: 100,
                height: 100,
              )),
          SizedBox(width: 15.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${product.title}', style: blackTextW500Font13),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  child: Text("\$${product.price}", style: greyTextW400Font11),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                          onTap: () {
                            context
                                .read<CartCubit>()
                                .incrementQuantity(currentIndex);
                          },
                          child: Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: AppColors.white,
                                shape: BoxShape.circle,
                                border: Border.all(color: AppColors.greyBorder)),
                            width: 25.sp,
                            height: 25.sp,
                            child: SvgPicture.asset(AppIcons.arrowUp),
                          )),
                      Padding(
                        padding:   EdgeInsets.symmetric(horizontal: 10.w),
                        child: Text('${product.quant}'),
                      ),
                      GestureDetector(
                          onTap: () {
                            context
                                .read<CartCubit>()
                                .decrementQuantity(currentIndex);
                          },
                          child: Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: AppColors.white,
                                shape: BoxShape.circle,
                                border: Border.all(color: AppColors.greyBorder)),
                            width: 25.sp,
                            height: 25.sp,
                            child: SvgPicture.asset(AppIcons.arrowDown),
                          )),
                      Spacer(),
                      GestureDetector(
                          onTap: () {
                            context.read<CartCubit>().deleteProduct(product);
                          },
                          child: Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: AppColors.white,
                                shape: BoxShape.circle,
                                border: Border.all(color: AppColors.greyBorder)),
                            width: 25.sp,
                            height: 25.sp,
                            child: SvgPicture.asset(AppIcons.delete),
                          ))
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
