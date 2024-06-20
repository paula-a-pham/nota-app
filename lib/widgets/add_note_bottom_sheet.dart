import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nota/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:nota/cubits/notes_cubit/notes_cubit.dart';
import 'package:nota/widgets/custom_form.dart';

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
      child: BlocProvider(
        create: (context) => AddNoteCubit(),
        child: BlocConsumer<AddNoteCubit, AddNoteState>(
          listener: (context, state) {
            if (state is AddNoteSuccess) {
              NotesCubit.getNotesCubit(context).getAllNotes();
              Navigator.pop(context);
            }
            if (state is AddNoteFailure) {
              if (kDebugMode) {
                print('Add note error : ${state.error}');
              }
            }
          },
          builder: (context, state) {
            return CustomForm(
              onPressed: (note) {
                AddNoteCubit.getAddNoteCubit(context).addNote(note);
              },
            );
          },
        ),
      ),
    );
  }
}
