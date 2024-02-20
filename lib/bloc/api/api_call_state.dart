import 'package:rapid_api_bloc/model/product_model.dart';

abstract class ApiState {}

class ApiLoadingState extends ApiState {}

class ApiSuccessState extends ApiState {
  ApiSuccessState(this.saveData);
  List<SearchedProduct?> saveData = [];
}

class ApiFailedState extends ApiState {}

class ApiSearchSuccessState extends ApiState {
  ApiSearchSuccessState(this.searchItem);
  String searchItem = '';
}
