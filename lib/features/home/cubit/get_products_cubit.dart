import 'package:ecommerce/features/home/data/model/products_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/repository/products_repo.dart';
import 'get_products_state.dart';

class GetProductsCubit extends Cubit<GetProductsState> {
  GetProductsCubit(this.productsRepo) : super(GetProductsInitial());
  final ProductsRepo productsRepo;
  List<ProductsModel> products = [];

  int offset = 0;
  Future<void> getProducts() async {
    if (offset == 0) {
      emit(GetProductsLoading());
    }

    final result = await productsRepo.getProducts(offset);
    result.fold((left) {
      emit(GetProductsError(left));
      debugPrint('Get products Failed');
    }, (right) {
      products.addAll(right);
      emit(GetProductsDone());

      debugPrint('Get Products successful with offset $offset');
      offset++;
    });
  }

  void updateProduct(ProductsModel updatedProduct) {
    final updatedProducts = products.map((product) {
      return product.id == updatedProduct.id ? updatedProduct : product;
    }).toList();

    products = updatedProducts;
    emit(GetProductsDone());
    debugPrint('Product updated successfully');
  }
}
