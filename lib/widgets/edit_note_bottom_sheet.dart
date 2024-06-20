import 'package:flutter/material.dart';
import 'package:nota/cubits/notes_cubit/notes_cubit.dart';
import 'package:nota/models/note_model.dart';
import 'package:nota/widgets/custom_filled_button.dart';
import 'package:nota/widgets/custom_text_form_field.dart';

class EditNoteBottomSheet extends StatefulWidget {
  final NoteModel note;

  const EditNoteBottomSheet({super.key, required this.note});

  @override
  State<EditNoteBottomSheet> createState() => _EditNoteBottomSheetState();
}

class _EditNoteBottomSheetState extends State<EditNoteBottomSheet> {
  String? title, subTitle;
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
            textEditingController:
                TextEditingController(text: widget.note.title),
            onChanged: (value) => title = value,
            maxLines: 1,
            fontSize: 20,
            hintText: 'Title',
          ),
          const SizedBox(
            height: 10.0,
          ),
          CustomTextFormField(
            textEditingController:
                TextEditingController(text: widget.note.subTitle),
            onChanged: (value) => subTitle = value,
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
                child: CustomFilledButton(
                    onPressed: () {
                      widget.note.title = title ?? widget.note.title;
                      widget.note.subTitle = subTitle ?? widget.note.subTitle;
                      widget.note.save();
                      NotesCubit.getNotesCubit(context).getAllNotes();
                    },
                    title: 'Save'),
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
