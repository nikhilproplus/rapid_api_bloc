import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:rapid_api_bloc/model/model.dart';

class DataService {

  
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
}
