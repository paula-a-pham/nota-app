import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nota/constants/colors.dart';
import 'package:nota/cubits/edit_note_cubit/edit_note_cubit.dart';
import 'package:nota/cubits/notes_cubit/notes_cubit.dart';
import 'package:nota/models/note_model.dart';
import 'package:nota/widgets/custom_filled_button.dart';
import 'package:nota/widgets/custom_text_form_field.dart';
import 'package:nota/widgets/edit_note_color_list_view.dart';

class EditNoteBottomSheet extends StatefulWidget {
  final NoteModel note;

  const EditNoteBottomSheet({super.key, required this.note});

  @override
  State<EditNoteBottomSheet> createState() => _EditNoteBottomSheetState();
}

class _EditNoteBottomSheetState extends State<EditNoteBottomSheet> {
  String? title, subTitle;
  int? colorIndex;
  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    if (widget.note.color == Colors.transparent.value) {
      colorIndex = 0;
    } else {
      colorIndex = kColorList.indexOf(
        Color(widget.note.color),
      );
    }
    return Padding(
      padding: EdgeInsets.only(
          right: 25.0,
          left: 25.0,
          top: 25.0,
          bottom: MediaQuery.of(context).viewInsets.bottom),
      child: BlocProvider(
        create: (context) => EditNoteCubit(),
        child: BlocConsumer<EditNoteCubit, EditNoteState>(
          listener: (context, state) {
            if (state is EditNoteSuccess) {
              NotesCubit.getNotesCubit(context).getAllNotes();
              Navigator.pop(context);
            }
            if (state is EditNoteFailure) {
              if (kDebugMode) {
                print('Add note error : ${state.error}');
              }
            }
          },
          builder: (context, state) {
            return AbsorbPointer(
              absorbing: state is EditNoteLoading ? true : false,
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
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
                      height: 15.0,
                    ),
                    SizedBox(
                      height: 27 * 2,
                      child: EditNoteColorListView(
                        colorIndex: colorIndex!,
                      ),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: CustomFilledButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  widget.note.title =
                                      title ?? widget.note.title;
                                  widget.note.subTitle =
                                      subTitle ?? widget.note.subTitle;
                                  EditNoteCubit.getAddNoteCubit(context)
                                      .editNote(widget.note);
                                }
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
              ),
            );
          },
        ),
      ),
    );
  }
}
