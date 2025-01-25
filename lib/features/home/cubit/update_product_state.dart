
import '../data/model/products_model.dart';

abstract class UpdateProductState {}

class UpdateProductsInitial extends UpdateProductState {}

class UpdateProductsLoading extends UpdateProductState {}

class UpdateProductsEmpty extends UpdateProductState {}

class UpdateProductsError extends UpdateProductState {
  final String errorMessage;

  UpdateProductsError(this.errorMessage) ;
}

class UpdateProductsDone extends UpdateProductState {
  ProductsModel productsModel;
  UpdateProductsDone(this.productsModel);
}
