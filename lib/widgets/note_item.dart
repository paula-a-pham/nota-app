import 'package:flutter/material.dart';
import 'package:nota/models/note_model.dart';

class NoteItem extends StatelessWidget {
  final NoteModel note;
  const NoteItem({
    super.key,
    required this.note,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(note.color),
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
            color: note.color == Colors.transparent.value
                ? Colors.white
                : Color(note.color),
            width: 0.5),
      ),
      child: ListTile(
        title: Text(
          note.title,
          style: TextStyle(
              color: note.color == Colors.transparent.value
                  ? Colors.white
                  : Colors.black,
              fontWeight: FontWeight.w500),
        ),
        subtitle: Text(
          note.subTitle,
          maxLines: 5,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: note.color == Colors.transparent.value
                  ? Colors.white70
                  : Colors.black54),
        ),
      ),
    );
  }
}
