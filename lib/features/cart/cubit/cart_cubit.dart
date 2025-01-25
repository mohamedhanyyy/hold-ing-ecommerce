import 'package:ecommerce/core/cubit/cubit_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../services/hive/hive_helper.dart';
import '../../home/data/model/products_model.dart';

class CartCubit extends Cubit<CubitState> {
  CartCubit() : super(CubitInitial());

  final List<ProductsModel> _products = [];
  double _totalPrice = 0;

  List<ProductsModel> get products => List.unmodifiable(_products);
  double get totalPrice => _totalPrice;

  /// Load products from the database into the cart.
  void loadProductsFromDatabase() {
    final items = HiveHelper.getItems();
    _products.clear();

    for (var item in items) {
      final json = Map<String, dynamic>.from(item.toJson());
      _products.add(ProductsModel.fromJson(json));
    }

    if (_products.isEmpty) {
      emit(CubitEmpty());
    } else {
      _calculateTotalPrice();
      emit(CubitDone());
    }
  }


  //delete all products

  Future<void> deleteAllProducts() async {
    _products.clear();
    _totalPrice=0;
    await HiveHelper.deleteAllItems();
    emit(CubitDone());

  }
  /// Delete a product from the cart.
  void deleteProduct(ProductsModel product) {
    if (product.id == null) {
      return; // Handle null ID if necessary.
    }

    _products.remove(product);
    HiveHelper.deleteItem(product.id!);

    if (_products.isEmpty) {
      emit(CubitEmpty());
    } else {
      _calculateTotalPrice();
      emit(CubitDone());
    }
  }

  /// Increment the quantity of a product at the specified index.
  void incrementQuantity(int index) {
    if (index < 0 || index >= _products.length) return;

    _products[index].quant += 1;
    _calculateTotalPrice();
    emit(CubitDone());
  }

  /// Decrement the quantity of a product at the specified index.
  void decrementQuantity(int index) {
    if (index < 0 || index >= _products.length) return;

    if (_products[index].quant > 0) {
      _products[index].quant -= 1;
      _calculateTotalPrice();
      emit(CubitDone());
    }
  }

  /// Calculate the total price of the products in the cart.
  void _calculateTotalPrice() {
    _totalPrice = _products.fold(
      0.0, (sum, product) => sum + (product.quant * (product.price ?? 0)),
    );
  }
}
