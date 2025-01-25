import 'package:dartz/dartz.dart';

import '../../../../core/const/api_consts.dart';
import '../../../../core/locator/service_locator.dart';
import '../../../../services/network/client/network_client.dart';
import '../../../../services/network/failure/network_failure.dart';
import '../model/categories_model.dart';

abstract class CategoriesRepo {
  Future<Either<String, List<CategoriesModel>>> getCategories();
}

class CategoriesRepoImpl implements CategoriesRepo {
  final networkClient = getIt.get<NetworkClient>();

  @override
  Future<Either<String, List<CategoriesModel>>> getCategories() async {
    final response = await networkClient.getData(url: EndPoints.categories);

    if (response != null && response.statusCode == 200) {
      try {
        // Parse the list of categories
        final List<dynamic> data = response.data;
        final categories = data.map((json) => CategoriesModel.fromJson(json)).toList();
        return Right(categories);
      } catch (e) {
        return Left('Failed to parse categories: $e');
      }
    } else {
      return Left(NetworkFailure.errorHandler(response));
    }
  }
}
