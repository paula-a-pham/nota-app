import 'package:flutter/material.dart';
import 'package:nota/constants/colors.dart';
import 'package:nota/widgets/color_item.dart';

class AddNoteColorListView extends StatefulWidget {
  const AddNoteColorListView({
    super.key,
  });

  @override
  State<AddNoteColorListView> createState() => _AddNoteColorListViewState();
}

class _AddNoteColorListViewState extends State<AddNoteColorListView> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {
          setState(() {
            currentIndex = index;
          });
        },
        child: ColorItem(
            isActive: currentIndex == index, color: kColorList[index]),
      ),
      separatorBuilder: (context, index) => const SizedBox(
        width: 10.0,
      ),
      itemCount: kColorList.length,
    );
  }
}
