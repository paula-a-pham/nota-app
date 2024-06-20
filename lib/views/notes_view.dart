import 'package:flutter/material.dart';
import 'package:nota/widgets/note_item.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nota'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            NoteItem(
                title: 'New Note', subTitle: 'This is a new note for testing')
          ],
        ),
      ),
    );
  }
}
