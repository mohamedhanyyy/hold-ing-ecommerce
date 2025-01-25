import 'package:ecommerce/features/home/cubit/get_products_cubit.dart';
import 'package:ecommerce/features/home/cubit/update_product_state.dart';
import 'package:ecommerce/services/navigation/navigation.dart';
import 'package:ecommerce/shared/widgets/custom_snack_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/model/products_model.dart';
import '../data/repository/products_repo.dart';

class UpdateProductCubit extends Cubit<UpdateProductState> {
  UpdateProductCubit(this.productsRepo) : super(UpdateProductsInitial());

  final ProductsRepo productsRepo;
  Future<void> editProduct(ProductsModel product) async {
    emit(UpdateProductsLoading());

    final result = await productsRepo.editProduct(product);
    result.fold((left) {
      emit(UpdateProductsError(left));
      debugPrint('Update products Failed');

      CustomSnackBars.showErrorToast(title: 'Failed to update product');
    }, (right) async {
      emit(UpdateProductsDone(product));
      AppRouter.context.read<GetProductsCubit>().updateProduct(product);
      AppRouter.pop();
      CustomSnackBars.showSuccessToast(title: 'Product updated successfully');
      debugPrint('Update Products successful');
    });
  }
}
