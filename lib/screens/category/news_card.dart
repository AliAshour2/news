import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/common/app_colors.dart';
import 'package:news/screens/category/models/news/articels.dart';
import 'package:news/screens/category/news_details_screen.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsCard extends StatelessWidget {
  const NewsCard({super.key, required this.articles});
  final Articles articles;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => NewsDetailsScreen(articles: articles)));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 25.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              articles.urlToImage ?? '',
              height: 232.h,
              width: double.infinity,
              fit: BoxFit.contain,
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              articles.author ?? '',
              style: const TextStyle(
                color: AppColors.grayColor,
              ),
            ),
            Text(
              articles.title ?? '',
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                timeago.format(DateTime.parse(articles.publishedAt ?? '')),
                style: TextStyle(
                  color: AppColors.grayColor,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w200,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
