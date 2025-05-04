import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/common/app_colors.dart';
import 'package:news/screens/category/models/news_model.dart';
import 'package:news/screens/category/news_card.dart';

class CategoryDetailsView extends StatefulWidget {
  const CategoryDetailsView(
      {super.key, required this.id, this.searchQuery = ''});
  final String id;
  final String searchQuery;

  @override
  State<CategoryDetailsView> createState() => _CategoryDetailsViewState();
}

class _CategoryDetailsViewState extends State<CategoryDetailsView> {
  int selectedSubCategoryId = 0;
  final List<NewsModel> mockNewsList = [
    NewsModel(
      id: '1',
      imagePath: 'assets/NewsTest.png',
      title: 'Breaking News: Flutter 4.0 Released!',
      publisher: 'Flutter Times',
      publishedDate: DateTime.now().subtract(const Duration(hours: 2)),
    ),
    NewsModel(
      id: '2',
      imagePath: 'assets/NewsTest.png',
      title: 'AI is Changing the World',
      publisher: 'Tech Daily',
      publishedDate: DateTime.now().subtract(const Duration(days: 1)),
    ),
    NewsModel(
      id: '3',
      imagePath: 'assets/NewsTest.png',
      title: 'New Discoveries in Space',
      publisher: 'Space News',
      publishedDate: DateTime.now().subtract(const Duration(days: 3)),
    ),
    NewsModel(
      id: '4',
      imagePath: 'assets/NewsTest.png',
      title: 'Top 10 Programming Languages in 2025',
      publisher: 'Code World',
      publishedDate: DateTime.now().subtract(const Duration(days: 5)),
    ),
    NewsModel(
      id: '5',
      imagePath: 'assets/NewsTest.png',
      title: 'How to Stay Productive While Working Remotely',
      publisher: 'Remote Life',
      publishedDate: DateTime.now().subtract(const Duration(days: 7)),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final filteredList = widget.searchQuery.isEmpty
        ? mockNewsList
        : mockNewsList
            .where((news) => news.title
                .toLowerCase()
                .contains(widget.searchQuery.toLowerCase()))
            .toList();
    return ListView(
      children: [
        SizedBox(
          height: 50.h,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) => Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2.w),
                    child: ChoiceChip(
                      onSelected: (value) {
                        selectedSubCategoryId = index;
                        setState(() {});
                      },
                      padding: const EdgeInsetsDirectional.symmetric(
                          horizontal: 10, vertical: 5),
                      label: Text('Data$index'),
                      selected: index == selectedSubCategoryId,
                      showCheckmark: false,
                      selectedColor: AppColors.primaryColor,
                      labelStyle: TextStyle(
                        color: index == 0 ? Colors.white : null,
                      ),
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(color: AppColors.primaryColor),
                        borderRadius: BorderRadius.circular(25.r),
                      ),
                    ),
                  )),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => NewsCard(
            newsModel: filteredList[index],
          ),
          itemCount: filteredList.length,
        ),
      ],
    );
  }
}
