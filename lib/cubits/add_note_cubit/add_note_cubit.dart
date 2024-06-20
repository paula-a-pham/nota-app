import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';
import 'package:nota/constants/constants.dart';
import 'package:nota/models/note_model.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());

  static AddNoteCubit getAddNoteCubit(BuildContext context) =>
      BlocProvider.of(context);

  void addNote(NoteModel note) async {
    try {
      emit(AddNoteLoading());
      Box<NoteModel> noteBox = Hive.box<NoteModel>(kNotesBox);
      await noteBox.add(note);
      emit(AddNoteSuccess());
    } catch (error) {
      emit(AddNoteFailure(error: error.toString()));
    }
  }
}
