import 'package:flutter/material.dart';
import 'package:nota/widgets/note_item.dart';

class CustomListView extends StatelessWidget {
  const CustomListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) => const NoteItem(
              title: 'New Note',
              subTitle: 'This is a new note for testing',
            ),
        separatorBuilder: (context, index) => const SizedBox(
              height: 10.0,
            ),
        itemCount: 5);
  }
}
