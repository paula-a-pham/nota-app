import 'package:flutter/material.dart';
import 'package:nota/constants/colors.dart';
import 'package:nota/widgets/add_note_bottom_sheet.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
            context: context,
            builder: (context) => const AddNoteBottomSheet(),
            isScrollControlled: true);
      },
      backgroundColor: kPrimaryColor,
      foregroundColor: Colors.white,
      shape: const CircleBorder(),
      child: const Icon(Icons.add),
    );
  }
}
