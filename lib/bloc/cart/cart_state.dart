import 'package:rapid_api_bloc/model/product_model.dart';

abstract class CartState {}

class CartItemEmptyState extends CartState {}

class CartItemAddedState extends CartState {
  CartItemAddedState(this.saveData);
  List<Datum?> saveData = [];
}

class CartItemRemovedState extends CartState {
  CartItemRemovedState(this.saveData);
  List<SearchedProduct?> saveData = [];
}

class CartItemFailedState extends CartState {}
