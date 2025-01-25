import 'package:ecommerce/services/navigation/navigation.dart';
import 'package:ecommerce/shared/widgets/custom_button.dart';
import 'package:ecommerce/shared/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/strings.dart';
import '../../../../core/resources/styles.dart';
import '../../cubit/update_product_cubit.dart';
import '../../cubit/update_product_state.dart';
import '../../data/model/products_model.dart';

class EditProductBottomSheet extends StatelessWidget {
  final ProductsModel product;
  const EditProductBottomSheet({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController(text: product.title);

    final priceController =
        TextEditingController(text: product.price.toString());
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 22.h),
        Center(child: Text(AppStrings.editProduct, style: darkBlueTextW700Font16)),
        SizedBox(height: 41.h),
        Padding(
            padding:   EdgeInsets.symmetric(horizontal: 20.w),
            child: Text(AppStrings.title, style: grey3TextW500Font14)),
        Padding(
            padding:   EdgeInsets.symmetric(horizontal: 20.w, vertical: 5),
            child: CustomTextField(controller: titleController)),
        SizedBox(height: 24.h),
        Padding(
            padding:   EdgeInsets.symmetric(horizontal: 20.w),
            child: Text(AppStrings.price, style: grey3TextW500Font14)),
        Padding(
            padding:   EdgeInsets.symmetric(horizontal: 20.w, vertical: 5),
            child: CustomTextField(
                controller: priceController,
                keyboardType: TextInputType.number)),
        SizedBox(height: 52.h),
        BlocBuilder<UpdateProductCubit, UpdateProductState>(
            builder: (context, state) {
          if (state is UpdateProductsLoading) {
            return CustomLoadingButtonWidget();
          }
          return CustomElevatedButton(
            onTap: () {
              AppRouter.context.read<UpdateProductCubit>().editProduct(
                    product.copyWith(
                      title: titleController.text,
                      price: int.parse(priceController.text),
                    ),
                  );
            },
            buttonText:AppStrings.update,
          );
        })
      ],
    );
  }
}
