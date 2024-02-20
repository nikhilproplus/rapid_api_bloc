import 'package:get/get.dart';
import 'package:rapid_api_bloc/bloc/api/api_call_event.dart';

import 'package:bloc/bloc.dart';
import 'package:rapid_api_bloc/bloc/api/api_call_state.dart';
import 'package:rapid_api_bloc/model/product_model.dart';
import 'package:rapid_api_bloc/service/service.dart';

class ApiBloc extends Bloc<ApiEvent, ApiState> {
  ApiBloc() : super(ApiLoadingState()) {
    // havnt completed
    on<ApiSearchEvent>((event, emit) async {
      emit(ApiLoadingState());

      String apiUrl =
          'https://real-time-product-search.p.rapidapi.com/search?q=${event.searchItem}%20shoes&country=us&language=en';

      var response = await DataService.getApiData(apiUrl);
      List<SearchedProduct?> saveData = [];

      try {
        saveData.clear();
        if (response != null) {
          saveData.addAll([response]);
        }

        if (saveData.isNotEmpty) {
          emit(ApiSuccessState(saveData));
        } else {
          emit(ApiFailedState());
        }
      } catch (e) {
        emit(ApiFailedState());
        throw Exception('Failed to get data in bloc $e');
      } finally {
        Get.back();
      }
    });

    on<ApiLoadingEvent>((event, emit) async {
      String apiUrl =
          'https://real-time-product-search.p.rapidapi.com/search?q=puma%20shoes&country=us&language=en';
      emit(ApiLoadingState());
      var response = await DataService.getApiData(apiUrl);

      List<SearchedProduct?> saveData = [];

      try {
        saveData.clear();
        if (response != null) {
          saveData.addAll([response]);
        }

        if (saveData.isNotEmpty) {
          emit(ApiSuccessState(saveData));
        } else {
          emit(ApiFailedState());
        }
      } catch (e) {
        emit(ApiFailedState());
        throw Exception('Failed to get data in bloc $e');
      } finally {
        Get.back();
      }
    });
  }
}
