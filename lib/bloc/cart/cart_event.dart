import 'package:rapid_api_bloc/model/product_model.dart';

abstract class CartEvent {}

class CartItemAddedEvent extends CartEvent {
  CartItemAddedEvent(this.items);
  Datum items;
}

class CartItemRemovedEvent extends CartEvent {
  CartItemRemovedEvent(this.index);
  int index;
}
