// ignore_for_file: public_member_api_docs, sort_constructors_first
class NewsModel {
  String id;
  String imagePath;
  String title;
  String publisher;
  DateTime publishedDate;
  NewsModel(
      {required this.id,
      required this.imagePath,
      required this.title,
      required this.publisher,
      required this.publishedDate});
}
