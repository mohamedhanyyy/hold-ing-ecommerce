import 'package:dartz/dartz.dart';

import '../../../../../core/const/api_consts.dart';
import '../../../../../core/locator/service_locator.dart';
import '../../../../../services/network/client/network_client.dart';
import '../../../../../services/network/failure/network_failure.dart';

import '../model/products_model.dart';

abstract class ProductsRepo {
  Future<Either<String, List<ProductsModel>>> getProducts(int offset);
  Future<Either<String, ProductsModel>> editProduct(ProductsModel product);
}

class ProductsRepoImpl implements ProductsRepo {
  final networkClient = getIt.get<NetworkClient>();

  @override
  Future<Either<String, List<ProductsModel>>> getProducts(int offset) async {
    final response = await networkClient.getData(
      url: EndPoints.products,
      query: {
        'offset': offset,
        'limit': 10,
      },
    );

    if (response != null && response.statusCode == 200) {
      final List<dynamic> data = response.data;
      final products =
          data.map((json) => ProductsModel.fromJson(json)).toList();
      return Right(products);
    } else {
      return Left(NetworkFailure.errorHandler(response));
    }
  }

  @override
  Future<Either<String, ProductsModel>> editProduct(
      ProductsModel product) async {
    final response =
        await networkClient.putData(url: '${EndPoints.products}/${product.id}');
    if (response?.statusCode == 200) {
      return Right(ProductsModel.fromJson(response?.data));
    } else {
      return Left(NetworkFailure.errorHandler(response));
    }
  }
}
