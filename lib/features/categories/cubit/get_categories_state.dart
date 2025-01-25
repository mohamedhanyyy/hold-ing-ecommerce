import 'package:ecommerce/features/categories/data/model/categories_model.dart';

abstract class GetCategoryState {}

class GetCategoryInitial extends GetCategoryState {}

class GetCategoryLoading extends GetCategoryState {}

class GetCategoryEmpty extends GetCategoryState {}

class GetCategoryError extends GetCategoryState {
  final String errorMessage;

  GetCategoryError(this.errorMessage);
}

class GetCategoryDone extends GetCategoryState {
  List<CategoriesModel> categoriesModel = [];
  GetCategoryDone(this.categoriesModel);
}
