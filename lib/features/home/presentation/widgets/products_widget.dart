import 'package:ecommerce/features/home/presentation/widgets/product_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../shared/widgets/custom_loading_widget.dart';
import '../../cubit/get_products_cubit.dart';
import '../../cubit/get_products_state.dart';

class ProductsWidget extends StatefulWidget {
  const ProductsWidget({super.key});

  @override
  State<ProductsWidget> createState() => _ProductsWidgetState();
}

class _ProductsWidgetState extends State<ProductsWidget> {
  final _scrollController = ScrollController();
  late GetProductsCubit getProductsCubit;

  @override
  void initState() {
    super.initState();
    getProductsCubit = context.read<GetProductsCubit>();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 100) {
      getProductsCubit.getProducts();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetProductsCubit, GetProductsState>(
      builder: (context, state) {
        if (state is GetProductsLoading) {
          return CustomLoadingWidget();
        } else if (state is GetProductsDone) {
          return SizedBox(
            height: 500.h,
            child: GridView.builder(
                controller: _scrollController,
                itemCount: getProductsCubit.products.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 230.h,
                  mainAxisSpacing: 7.5,
                  crossAxisSpacing: 7.5,
                ),
                itemBuilder: (context, index) {
                  return ProductItemWidget(
                      item: getProductsCubit.products[index]);
                }),
          );
        }
        return SizedBox.shrink();
      },
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
