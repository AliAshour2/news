import 'package:flutter/material.dart';
import 'package:news/api/api_services.dart';
import 'package:news/api/models/sources.dart';
import 'package:news/api/models/sources_model.dart';
import 'package:news/screens/category/widgets/sources_list.dart';

class CategoryDetailsView extends StatefulWidget {
  const CategoryDetailsView(
      {super.key, required this.id, this.searchQuery = ''});
  final String id;
  final String searchQuery;

  @override
  State<CategoryDetailsView> createState() => _CategoryDetailsViewState();
}

class _CategoryDetailsViewState extends State<CategoryDetailsView> {
  String selectedSubCategoryId = '';

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        FutureBuilder(
            future: ApiServices.getSources(widget.id),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.blueAccent,
                  ),
                );
              } else if (snapshot.hasError) {
                return Center(
                    child: Text('error: ${snapshot.error.toString()}'));
              }

              SourcesModel? sourceModel = snapshot.data;
              List<Sources> sources = sourceModel?.sources ?? [];

              return SourcesList(
                  categoryId: widget.id,
                  changeSeletedSource: (sourceId) {},
                  sources: sources);
            }),
      ],
    );
  }
}
