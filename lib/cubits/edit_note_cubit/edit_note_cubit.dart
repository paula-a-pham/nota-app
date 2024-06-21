import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nota/models/note_model.dart';

part 'edit_note_state.dart';

class EditNoteCubit extends Cubit<EditNoteState> {
  EditNoteCubit() : super(EditNoteInitial());
  int noteColor = Colors.transparent.value;
  static EditNoteCubit getAddNoteCubit(BuildContext context) =>
      BlocProvider.of(context);
  void editNote(NoteModel note) async {
    try {
      emit(EditNoteLoading());
      note.color = noteColor;
      await note.save();
      emit(EditNoteSuccess());
    } catch (error) {
      emit(EditNoteFailure(error: error.toString()));
    }
  }
}
