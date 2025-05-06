import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/api/models/sources.dart';
import 'package:news/common/app_colors.dart';

import 'news_list.dart';

class SourcesList extends StatefulWidget {
  const SourcesList(
      {super.key,
      required this.categoryId,
      required this.changeSeletedSource,
      required this.sources});
  final String categoryId;
  final void Function(String) changeSeletedSource;
  final List<Sources> sources;

  @override
  State<SourcesList> createState() => _SourcesListState();
}

class _SourcesListState extends State<SourcesList> {
  String? selectedSourceId;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedSourceId = widget.sources.isEmpty ? widget.sources[0].id : null;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 50.h,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.sources.length,
              itemBuilder: (context, index) => Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2.w),
                    child: ChoiceChip(
                      onSelected: (value) {
                        selectedSourceId = widget.sources[index].id;
                        setState(() {});
                      },
                      padding: const EdgeInsetsDirectional.symmetric(
                          horizontal: 10, vertical: 5),
                      label: Text(widget.sources[index].name ?? ''),
                      selected: widget.sources[index].id == selectedSourceId,
                      showCheckmark: false,
                      selectedColor: AppColors.primaryColor,
                      labelStyle: TextStyle(
                        color: widget.sources[index].id == selectedSourceId
                            ? Colors.white
                            : null,
                      ),
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(color: AppColors.primaryColor),
                        borderRadius: BorderRadius.circular(25.r),
                      ),
                    ),
                  )),
        ),
        if (selectedSourceId != null)
          NewsList(
            sourceId: selectedSourceId!,
          )
      ],
    );
  }
}
