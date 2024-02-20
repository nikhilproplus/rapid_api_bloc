import 'package:rapid_api_bloc/model/product_model.dart';

abstract class JobSearchState {}

class JobSearchLoadingState extends JobSearchState {}

class JobSearchSuccessState extends JobSearchState {
  JobSearchSuccessState(this.saveData);
  List<SearchedProduct?> saveData = [];
}

class JobSearchFailedState extends JobSearchState {}
