import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:rapid_api_bloc/model/job_search_model.dart';
import 'package:rapid_api_bloc/model/product_model.dart';

class DataService {
  /////////////// SHOE CART SERVICE //////////////////////////////
  static Future<SearchedProduct?> getApiData(String apiUrl) async {
    debugPrint(apiUrl);
    try {
      final response = await http.get(Uri.parse(apiUrl), headers: {
        'X-RapidAPI-Key': '6b33c0d435msh83caf79e8b731bbp15959djsn26626e4302fa',
        'X-RapidAPI-Host': 'real-time-product-search.p.rapidapi.com',
      });

      debugPrint(response.body);

      if (response.statusCode == 200) {
        debugPrint('200 success');
        return searchedProductFromJson(response.body);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

/////////////////////// JOB SEARCH SERVICE///////////////////////////
  static Future<JobSearchModel?> getJobDetails(String apiUrl) async {
    debugPrint(apiUrl);
    try {
      final response = await http.get(Uri.parse(apiUrl), headers: {
        'X-RapidAPI-Key': '6b33c0d435msh83caf79e8b731bbp15959djsn26626e4302fa',
        'X-RapidAPI-Host': 'jsearch.p.rapidapi.com',
      });

      debugPrint(response.body);

      if (response.statusCode == 200) {
        debugPrint('200 success');
        return jobSearchModelFromJson(response.body);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
