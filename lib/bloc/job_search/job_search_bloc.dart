import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import 'package:rapid_api_bloc/bloc/job_search/job_search_event.dart';
import 'package:rapid_api_bloc/bloc/job_search/job_search_state.dart';
import 'package:rapid_api_bloc/model/product_model.dart';
import 'package:rapid_api_bloc/service/service.dart';

class JobSearchBloc extends Bloc<JobSearchEvent, JobSearchState> {
  JobSearchBloc() : super(JobSearchLoadingState()) {
    // havnt completed
    on<JobSearchSuccessEvent>((event, emit) async {
      emit(JobSearchLoadingState());

      String apiUrl =
          'https://jsearch.p.rapidapi.com/search?query=${event.searchItem}%20developer%20in%India%2C%20Kochi&page=1&num_pages=1';

      var response = await DataService.getApiData(apiUrl);
      List<SearchedProduct?> saveData = [];

      try {
        saveData.clear();
        if (response != null) {
          saveData.addAll([response]);
        }

        if (saveData.isNotEmpty) {
          emit(JobSearchSuccessState(saveData));
        } else {
          emit(JobSearchFailedState());
        }
      } catch (e) {
        emit(JobSearchFailedState());
        throw Exception('Failed to get data in bloc $e');
      } finally {
        Get.back();
      }
    });
  }
}
