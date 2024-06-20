import 'package:flutter/material.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          right: 25.0,
          left: 25.0,
          top: 25.0,
          bottom: MediaQuery.of(context).viewInsets.bottom),
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[],
      ),
    );
  }
}
