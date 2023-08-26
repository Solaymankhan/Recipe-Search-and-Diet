import 'dart:io';

import 'package:http/http.dart' as http;

import 'app_exeptions.dart';
import 'base_api_service.dart';

class network_api_service extends base_api_service {
  final header = {
    'Accept-Language': 'en',
    'X-RapidAPI-Key': '1463363c0cmshca45ec3e12115c5p1bf26fjsnea9f504ca5fd',
    'X-RapidAPI-Host': 'edamam-recipe-search.p.rapidapi.com',
  };
  final Uri uri =
      Uri.parse('https://edamam-recipe-search.p.rapidapi.com/api/recipes/v2');
  parameters(search_txt) {
    final Map<String, String> queryParams = {
      'type': 'public',
      'co2EmissionsClass': 'A+',
      'field[0]': 'uri',
      'beta': 'true',
      'random': 'true',
      'cuisineType[0]': 'American',
      'imageSize[0]': 'LARGE',
      'mealType[0]': 'Breakfast',
      'health[0]': 'alcohol-cocktail',
      'diet[0]': 'balanced',
      'dishType[0]': search_txt,
    };
    return queryParams;
  }

  @override
  Future getApi(String search_txt) async {
    var responseJson;
    try {
      final response = await http.get(uri.replace(queryParameters: parameters(search_txt)),
          headers: header);
      responseJson = returnResponse(response);
      return responseJson;
    } on SocketException {
      throw InternetExeption;
    } on RequestTimeout {
      throw RequestTimeout;
    }
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        //var responseJson=wetherModelFromJson(response.body.toString());
        return response.body;
      case 400:
        throw InvalidUrl;
      default:
        throw FetchDataExeption;
    }
  }
}
