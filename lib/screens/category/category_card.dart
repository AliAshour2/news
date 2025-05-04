import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/screens/category/models/category_model.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard(
      {super.key, required this.categoryModel, required this.index});
  final CategoryModel categoryModel;
  final int index;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: categoryModel.color,
            borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(25),
                topRight: const Radius.circular(25),
                bottomRight:
                    index.isOdd ? const Radius.circular(25) : const Radius.circular(0),
                bottomLeft:
                    index.isEven ? const Radius.circular(25) : const Radius.circular(0))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              categoryModel.imagePath,
              width: 100.w,
              fit: BoxFit.contain,
            ),
            Text(
              categoryModel.title,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontSize: 18, fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }
}
