import 'package:flutter/material.dart';
import 'package:nota/constants/colors.dart';
import 'package:nota/cubits/edit_note_cubit/edit_note_cubit.dart';
import 'package:nota/widgets/color_item.dart';

class EditNoteColorListView extends StatefulWidget {
  final int colorIndex;
  const EditNoteColorListView({super.key, required this.colorIndex});

  @override
  State<EditNoteColorListView> createState() => _EditNoteColorListViewState();
}

class _EditNoteColorListViewState extends State<EditNoteColorListView> {
  int currentIndex = 0;
  @override
  void initState() {
    super.initState();
    currentIndex = widget.colorIndex;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {
          setState(() {
            currentIndex = index;
            if (index == 0) {
              EditNoteCubit.getAddNoteCubit(context).noteColor =
                  Colors.transparent.value;
            } else {
              EditNoteCubit.getAddNoteCubit(context).noteColor =
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
