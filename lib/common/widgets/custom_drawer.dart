import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/common/app_colors.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key, required this.onTap});

  final Function(DrawerItem) onTap;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 320.w,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(14), bottomRight: Radius.circular(14))),
      backgroundColor: Colors.white,
      child: Column(
        children: [
          Container(
            height: 140.h,
            width: 320.w,
            color: AppColors.primaryColor,
            alignment: Alignment.center,
            child: Text(
              'data',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.list_rounded,
              size: 30,
            ),
            title: Text(
              'Category',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Colors.black),
            ),
            onTap: () {
              onTap(DrawerItem.category);
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.settings,
              size: 30,
            ),
            title: Text(
              'Settings',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Colors.black),
            ),
            onTap: () {
              onTap(DrawerItem.settings);
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}

enum DrawerItem {
  category,
  settings,
}
