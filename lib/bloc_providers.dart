import 'package:ecommerce/features/categories/cubit/get_categories_cubit.dart';
import 'package:ecommerce/features/categories/data/repository/categories_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/locator/service_locator.dart';
import 'features/cart/cubit/cart_cubit.dart';
import 'features/home/cubit/get_products_cubit.dart';
import 'features/home/cubit/update_product_cubit.dart';
import 'features/home/data/repository/products_repo.dart';

final blocProviders = [
  BlocProvider<GetProductsCubit>(
      create: (context) =>
          GetProductsCubit(getIt<ProductsRepo>())..getProducts()),
  BlocProvider<GetCategoriesCubit>(
      create: (context) =>
          GetCategoriesCubit(getIt<CategoriesRepo>())..getCategories()),

  BlocProvider<UpdateProductCubit>(
      create: (context) => UpdateProductCubit(getIt<ProductsRepo>())),

  BlocProvider<CartCubit>(create: (context) => CartCubit()),
];
