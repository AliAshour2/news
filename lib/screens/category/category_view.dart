import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/common/app_assets.dart';

import 'package:news/screens/category/models/category_model.dart';
import 'package:news/screens/category/category_card.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key, required this.onTap});
  final Function(CategoryModel) onTap;
  @override
  Widget build(BuildContext context) {
    List<CategoryModel> categories = [
      CategoryModel(
        id: '1',
        imagePath: AppAssets.ball,
        title: 'Sports',
        color: Colors.black,
      ),
      CategoryModel(
        id: '2',
        imagePath: AppAssets.business,
        title: 'Business',
        color: Colors.blue,
      ),
      CategoryModel(
        id: '3',
        imagePath: AppAssets.environment,
        title: 'Enviroment',
        color: Colors.greenAccent,
      ),
      CategoryModel(
        id: '4',
        imagePath: AppAssets.health,
        title: 'Health',
        color: Colors.redAccent,
      ),
      CategoryModel(
        id: '5',
        imagePath: AppAssets.politics,
        title: 'Politics',
        color: Colors.blueGrey,
      ),
      CategoryModel(
        id: '6',
        imagePath: AppAssets.science,
        title: 'Science',
        color: Colors.deepOrange,
      ),
    ];

    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(),
      padding: EdgeInsets.symmetric(vertical: 35.h, horizontal: 35.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 2,
        children: [
          Text(
            'Category of your intrest',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 30.w),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20.h,
                    mainAxisSpacing: 15.w),
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () => onTap(categories[index]),
                  child: CategoryCard(
                    categoryModel: categories[index],
                    index: index,
                  ),
                ),
                itemCount: categories.length,
              ),
            ),
          )
        ],
      ),
    );
  }
}
