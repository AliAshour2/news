import 'package:flutter/material.dart';
import 'package:news/common/widgets/custom_drawer.dart';
import 'package:news/screens/category/category_details.view.dart';
import 'package:news/screens/category/category_view.dart';
import 'package:news/screens/category/models/category_model.dart';
import 'package:news/screens/settings/settings_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DrawerItem selectedView = DrawerItem.category;
  CategoryModel? selectedCategoryCard;
  bool isSearching = false;
  String searchQuery = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: selectedCategoryCard != null
            ? isSearching
                ? TextField(
                    decoration: const InputDecoration(
                        hintText: 'Search', border: InputBorder.none),
                    style: const TextStyle(color: Colors.white),
                    onChanged: (value) {
                      setState(() {
                        searchQuery = value;
                      });
                    },
                  )
                : Text(selectedCategoryCard!.title)
            : selectedView == DrawerItem.settings
                ? const Text('Setting')
                : const Text('News App'),
        actions: selectedCategoryCard != null
            ? [
                IconButton(
                  onPressed: () {
                    setState(() {
                      isSearching = !isSearching;
                      if (!isSearching) {
                        searchQuery = '';
                      }
                    });
                  },
                  icon: Icon(isSearching ? Icons.close : Icons.search),
                ),
              ]
            : null,
      ),
      drawer: CustomDrawer(
        onTap: (p0) {
          selectedView = p0;
          selectedCategoryCard = null;
          isSearching = false;
          searchQuery = '';
          setState(() {});
        },
      ),
      body: selectedCategoryCard != null
          ? CategoryDetailsView(
              id: selectedCategoryCard!.id,
              searchQuery: searchQuery,
            )
          : selectedView == DrawerItem.category
              ? CategoryView(onTap: (p0) {
                  selectedCategoryCard = p0;
                  isSearching = false;
                  searchQuery = '';
                  setState(() {});
                })
              : const SettingsView(),
    );
  }
}
