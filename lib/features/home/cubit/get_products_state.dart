abstract class GetProductsState {}

class GetProductsInitial extends GetProductsState {}

class GetProductsLoading extends GetProductsState {}

class GetProductsEmpty extends GetProductsState {}

class GetProductsError extends GetProductsState {
  final String errorMessage;

  GetProductsError(this.errorMessage);
}

class GetProductsDone extends GetProductsState {}
