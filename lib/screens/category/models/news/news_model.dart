import 'package:news/screens/category/models/news/articels.dart';

class NewsModel {
  String? status;
  int? totalResults;
  List<Articles>? articles;

  NewsModel({this.status, this.totalResults, this.articles});

  NewsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    totalResults = json['totalResults'];
    articles = json['articles'] == null
        ? null
        : (json['articles'] as List).map((e) => Articles.fromJson(e)).toList();
  }

  static List<NewsModel> fromList(List<Map<String, dynamic>> list) {
    return list.map(NewsModel.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data['status'] = status;
    _data['totalResults'] = totalResults;
    if (articles != null) {
      _data['articles'] = articles?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}
