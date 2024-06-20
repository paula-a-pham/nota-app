import 'package:flutter/material.dart';
import 'package:nota/constants/colors.dart';
import 'package:nota/cubits/add_note_cubit/add_note_cubit.dart';
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
            if (index == 0) {
              AddNoteCubit.getAddNoteCubit(context).noteColor =
                  Colors.transparent.value;
            } else {
              AddNoteCubit.getAddNoteCubit(context).noteColor =
                  kColorList[index].value;
            }
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
