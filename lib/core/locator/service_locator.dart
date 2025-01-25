import 'package:ecommerce/features/categories/cubit/get_categories_cubit.dart';
import 'package:get_it/get_it.dart';
import '../../features/categories/data/repository/categories_repo.dart';
import '../../features/home/cubit/get_products_cubit.dart';
import '../../features/home/cubit/update_product_cubit.dart';
import '../../features/home/data/repository/products_repo.dart';
import '../../services/network/client/network_client.dart';

final GetIt getIt = GetIt.instance;

void setupLocator() {
  //Services Injection
  getIt.registerLazySingleton<NetworkClient>(() => NetworkClient());

  //Repository Injection
  getIt.registerLazySingleton<ProductsRepo>(() => ProductsRepoImpl());
  getIt.registerLazySingleton<CategoriesRepo>(() => CategoriesRepoImpl());

  //Cubit
  getIt.registerFactory<UpdateProductCubit>(() => UpdateProductCubit(getIt<ProductsRepo>()));
  getIt.registerFactory<GetProductsCubit>(() => GetProductsCubit(getIt<ProductsRepo>()));
  getIt.registerFactory<GetCategoriesCubit>(() => GetCategoriesCubit(getIt<CategoriesRepo>()));
 }
