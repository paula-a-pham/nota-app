import 'package:flutter/material.dart';
import 'package:nota/models/note_model.dart';
import 'package:nota/widgets/custom_filled_button.dart';
import 'package:nota/widgets/custom_text_form_field.dart';

class EditNoteBottomSheet extends StatelessWidget {
  final NoteModel note;

  const EditNoteBottomSheet({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          right: 25.0,
          left: 25.0,
          top: 25.0,
          bottom: MediaQuery.of(context).viewInsets.bottom),
      child: ListView(
        children: <Widget>[
          CustomTextFormField(
            textEditingController: TextEditingController(text: note.title),
            maxLines: 1,
            fontSize: 20,
            hintText: 'Title',
          ),
          const SizedBox(
            height: 10.0,
          ),
          CustomTextFormField(
            textEditingController: TextEditingController(text: note.subTitle),
            maxLines: 5,
            fontSize: 15,
            hintText: 'Sub Title',
          ),
          const SizedBox(
            height: 10.0,
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: CustomFilledButton(onPressed: () {}, title: 'Save'),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
