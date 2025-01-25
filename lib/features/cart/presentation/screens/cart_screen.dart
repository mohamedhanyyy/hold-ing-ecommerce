import 'package:ecommerce/core/cubit/cubit_state.dart';
import 'package:ecommerce/core/resources/styles.dart';
import 'package:ecommerce/features/cart/cubit/cart_cubit.dart';
import 'package:ecommerce/features/cart/presentation/widgets/cart_item_widget.dart';
import 'package:ecommerce/services/navigation/navigation.dart';
import 'package:ecommerce/shared/widgets/custom_button.dart';
import 'package:ecommerce/shared/widgets/custom_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/strings.dart';
import '../../../../core/routes/app_routes.dart';
import '../widgets/cash_on_delivery_widget.dart';
import '../widgets/order_info_widget.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late CartCubit cartCubit;
  @override
  void initState() {
    super.initState();
    cartCubit = context.read<CartCubit>();
    cartCubit.loadProductsFromDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.cart),
        titleTextStyle: blackTextW600Font17,
        centerTitle: true,
      ),
      body: BlocBuilder<CartCubit, CubitState>(
        builder: (context, state) {
          if (state is CubitEmpty) {
            return Center(
                child: Text(AppStrings.emptyCart, style: blackTextW600Font17));
          } else {
            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListView.builder(
                    itemBuilder: (context, index) {
                      return CartItemWidget(
                          currentIndex: index,
                          product: cartCubit.products[index]);
                    },
                    shrinkWrap: true,
                    itemCount: cartCubit.products.length,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Text(AppStrings.paymentMethod,
                        style: blackTextW500Font17),
                  ),
                  CashOnDeliveryWidget(),
                  OrderInfoWidget(subTotal: cartCubit.totalPrice)
                ],
              ),
            );
          }
        },
      ),
      bottomNavigationBar: CustomElevatedButton(
        onTap: () {
          if (cartCubit.totalPrice == 0 || cartCubit.products.isEmpty) {
            CustomSnackBars.showErrorToast(title: AppStrings.emptyCart);
            return;
          }
          cartCubit.deleteAllProducts();
          AppRouter.goRoute(AppRoutes.checkout);
        },
        buttonText: AppStrings.checkout,
      ),
    );
  }
}
