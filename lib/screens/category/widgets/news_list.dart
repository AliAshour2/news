import 'package:flutter/material.dart';
import 'package:news/api/api_services.dart';
import 'package:news/screens/category/models/news/articels.dart';
import 'package:news/screens/category/models/news/news_model.dart';
import 'package:news/screens/category/news_card.dart';

class NewsList extends StatelessWidget {
  const NewsList({super.key, required this.sourceId});
  final String sourceId;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiServices.getNews(sourceId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.blueAccent,
              ),
            );
          }

          if (snapshot.hasError) {
            // ignore: prefer_single_quotes
            return Center(
              child: Text("error: ${snapshot.error.toString()}"),
            );
          }

          NewsModel? newsModel = snapshot.data as NewsModel?;
          var newsList = newsModel?.articles ?? [];

          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => NewsCard(
              articles: newsList[index],
            ),
            itemCount: newsList.length,
          );
        });
  }
}
