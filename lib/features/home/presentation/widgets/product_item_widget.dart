import 'package:ecommerce/core/extenstions/string_extension.dart';
import 'package:ecommerce/features/home/data/model/products_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/resources/icons.dart';
import '../../../../core/resources/styles.dart';
import '../../../../shared/widgets/custom_network_image.dart';
import '../screens/product_details_screen.dart';
import 'edit_product_widget.dart';

class ProductItemWidget extends StatelessWidget {
  final ProductsModel item;
  const ProductItemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final formattedImage = '${item.images?.first}'.cleanSpecialCharacters();
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ProductDetailsScreen(product: item)));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 203.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15), color: Colors.grey),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: CustomCachedNetworkImage(
                    imageUrl: '$formattedImage',
                    height: 203.h,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 16,
                  right: 16,
                  child: GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return BottomSheet(
                                  onClosing: () {},
                                  builder: (context) =>
                                      EditProductBottomSheet(product: item));
                            });
                      },
                      child: CircleAvatar(
                          backgroundColor: Colors.grey.shade100,
                          radius: 15,
                          child: SvgPicture.asset(AppIcons.edit))),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: Text('${item.title}', style: blackTextW500Font11),
          ),
          Text('\$${item.price}', style: blackTextW600Font13)
        ],
      ),
    );
  }
}
