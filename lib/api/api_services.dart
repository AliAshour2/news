import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news/api/models/sources_model.dart';
import 'package:news/api/api_consts.dart';
import 'package:news/screens/category/models/news/news_model.dart';

class ApiServices {
  static Future<SourcesModel> getSources(String categoryId) async {
    try {
      var url = Uri.https(ApiConsts.baseUrl, ApiConsts.sourcesEndPoint,
          {'apiKey': ApiConsts.apiKey, 'category': categoryId});
      print('Requesting URL: $url'); // Debug print

      var response = await http.get(url);
      print('Response status code: ${response.statusCode}'); // Debug print
      print('Response body: ${response.body}'); // Debug print

      if (response.statusCode != 200) {
        throw Exception('Failed to load sources: ${response.statusCode}');
      }

      String body = response.body;
      var json = jsonDecode(body);
      return SourcesModel.fromJson(json);
    } catch (e) {
      print('Error in getSources: $e'); // Debug print
      rethrow;
    }
  }

  static getNews(String sourceId) async {
    try {
      var url = Uri.https(ApiConsts.baseUrl, ApiConsts.newsEndPoint,
          {'apiKey': ApiConsts.apiKey, 'sources': sourceId});
      var response = await http.get(url);
      String body = response.body;
      var json = jsonDecode(body);
      return NewsModel.fromJson(json);
    } catch (e) {
      print('Error in getSources: $e'); // Debug print
      rethrow;
    }
  }
}
