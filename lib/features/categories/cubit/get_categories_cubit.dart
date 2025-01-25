import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

 import '../data/repository/categories_repo.dart';
import 'get_categories_state.dart';

class GetCategoriesCubit extends Cubit<GetCategoryState> {
  GetCategoriesCubit(this.categoriesRepo) : super(GetCategoryInitial());

  final CategoriesRepo categoriesRepo ;
  Future<void> getCategories() async {
    emit(GetCategoryLoading());
    final result = await categoriesRepo.getCategories();
    result.fold((left) {
      debugPrint('Get categories Failed');

      emit(GetCategoryError(left));
      return left;
    }, (right) {
      emit(GetCategoryDone(right));
       debugPrint('Get categories successful');
      return right;
    });
   }
}
