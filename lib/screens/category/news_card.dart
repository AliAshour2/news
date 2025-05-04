import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/common/app_colors.dart';
import 'package:news/screens/category/models/news_model.dart';
import 'package:news/screens/category/news_details_screen.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsCard extends StatelessWidget {
  const NewsCard({super.key, required this.newsModel});
  final NewsModel newsModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => NewsDetailsScreen(newsModel: newsModel)));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 25.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              newsModel.imagePath,
              height: 232.h,
              width: double.infinity,
              fit: BoxFit.contain,
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              newsModel.publisher,
              style: const TextStyle(
                color: AppColors.grayColor,
              ),
            ),
            Text(
              newsModel.title,
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                timeago.format(newsModel.publishedDate),
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
