import 'dart:convert';

import 'package:ecommerce/core/const/app_consts.dart';
import 'package:ecommerce/shared/widgets/custom_snack_bar.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../features/home/data/model/products_model.dart';

class HiveHelper {
  static Future<void> addItem(ProductsModel product) async {
    final products = getItems();
    final box = Hive.box(AppConstants.hiveBox);

    for (int i = 0; i < products.length; i++) {
      if (products[i].id == product.id) {
        CustomSnackBars.showErrorToast(title: 'Item is in the cart');
        return;
      }
    }
    await box.add(product.toJson());
    CustomSnackBars.showSuccessToast(title: 'Item added successfully');
  }

  static List<ProductsModel> getItems() {
    final box = Hive.box(AppConstants.hiveBox);

    return box.values.map((e) {
      if (e is String) {
        return ProductsModel.fromJson(json.decode(e) as Map<String, dynamic>);
      } else if (e is Map) {
        return ProductsModel.fromJson(Map<String, dynamic>.from(e));
      } else {
        throw Exception('Unsupported data type in Hive box: ${e.runtimeType}');
      }
    }).toList();
  }

  static Future<void> deleteItem(int productId) async {
    final box = Hive.box(AppConstants.hiveBox);
    final products = getItems();

    final indexToRemove =
        products.indexWhere((product) => product.id == productId);

    if (indexToRemove != -1) {
      await box.deleteAt(indexToRemove);
      CustomSnackBars.showSuccessToast(title: 'Item removed successfully');
    } else {
      CustomSnackBars.showErrorToast(title: 'Item not found in the cart');
    }
  }

  static Future<void> deleteAllItems() async {
    final box = await Hive.openBox(AppConstants.hiveBox);
    await box.clear();

  }
}
