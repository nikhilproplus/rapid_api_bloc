import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:rapid_api_bloc/bloc/api/api_call_event.dart';

import 'package:bloc/bloc.dart';
import 'package:rapid_api_bloc/bloc/api/api_call_state.dart';
import 'package:rapid_api_bloc/bloc/cart/cart_event.dart';
import 'package:rapid_api_bloc/bloc/cart/cart_state.dart';
import 'package:rapid_api_bloc/model/model.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartItemEmptyState()) {
    List<Datum?> saveData = [];

    on<CartItemAddedEvent>((event, emit) async {
      if (saveData.contains(event.items)) {
        Fluttertoast.showToast(
            msg: "Item already in the cart",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.blue,
            fontSize: 16.0);
      } else {
        saveData.add(event.items);
        Fluttertoast.showToast(
            msg: "Item added to cart",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            fontSize: 16.0);
      }

      if (saveData.isNotEmpty) {
        emit(CartItemAddedState(saveData));
      } else {
        emit(CartItemFailedState());
      }
    });

    on<CartItemRemovedEvent>((event, emit) async {
      saveData.removeAt(event.index);
      Fluttertoast.showToast(
          msg: "Item removed",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          fontSize: 16.0);
      if (saveData.isEmpty) {
        emit(CartItemFailedState());
      } else {
        emit(CartItemAddedState(saveData));
      }
    });
  }
}
