import 'package:ecommerce/core/extenstions/string_extension.dart';
import 'package:ecommerce/core/resources/styles.dart';
import 'package:ecommerce/core/routes/app_routes.dart';
import 'package:ecommerce/services/navigation/navigation.dart';
import 'package:ecommerce/shared/widgets/custom_button.dart';
import 'package:ecommerce/shared/widgets/custom_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:readmore/readmore.dart';

import '../../../../core/resources/colors.dart';
import '../../../../core/resources/icons.dart';
import '../../../../core/resources/strings.dart';
import '../../../../services/hive/hive_helper.dart';
import '../../data/model/products_model.dart';

class ProductDetailsScreen extends StatelessWidget {
  final ProductsModel product;

  const ProductDetailsScreen({super.key, required this.product});
  @override
  Widget build(BuildContext context) {
    final image = '${product.images?.first}'.cleanSpecialCharacters();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              child: Stack(
                children: [
                  CustomCachedNetworkImage(
                    imageUrl: '$image',
                    height: 400,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                  Positioned(
                      top: 40,
                      left: 20,
                      right: 20,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            backgroundColor: AppColors.white,
                            child: BackButton(
                              onPressed: () {
                                AppRouter.pop();
                              },
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              AppRouter.goRoute(AppRoutes.cart);
                            },
                            child: CircleAvatar(
                              backgroundColor: AppColors.white,
                              child: SvgPicture.asset(AppIcons.bag),
                            ),
                          )
                        ],
                      ))
                ],
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${product.title}',
                        style: greyTextW400Font13,
                      ),
                      Text('${product.category?.name}',
                          style: blackTextW600Font22),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.price,
                        style: greyTextW400Font13,
                      ),
                      Text('\$${product.price}', style: blackTextW600Font22),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24),
              child: SizedBox(
                height: 77,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    final subImage =
                        '${product.images?[index]}'.cleanSpecialCharacters();

                    return Padding(
                      padding: EdgeInsets.only(right: 10.w),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.r),
                        child: CustomCachedNetworkImage(
                          imageUrl: '$subImage',
                          width: 77,
                          height: 77,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: product.images?.length,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Text(
                AppStrings.description,
                style: blackTextW600Font17,
              ),
            ),
            SizedBox(height: 5.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: ReadMoreText(
                '${product.description}',
                style: greyTextW400Font15,
                moreStyle: blackTextW500Font15,
                lessStyle: blackTextW500Font15,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomElevatedButton(
        onTap: () async {
          await HiveHelper.addItem(product);
        },
        buttonText: AppStrings.addToCart,
      ),
    );
  }
}
