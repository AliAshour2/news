import 'package:news/api/models/sources.dart';

class SourcesModel {
  String? status;
  List<Sources>? sources;

  SourcesModel({this.status, this.sources});

  SourcesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    sources = json['sources'] == null
        ? null
        : (json['sources'] as List).map((e) => Sources.fromJson(e)).toList();
  }

  static List<SourcesModel> fromList(List<Map<String, dynamic>> list) {
    return list.map(SourcesModel.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data['status'] = status;
    if (sources != null) {
      _data['sources'] = sources?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}
