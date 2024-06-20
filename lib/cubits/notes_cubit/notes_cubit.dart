import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:nota/constants/constants.dart';
import 'package:nota/models/note_model.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());

  static NotesCubit getNotesCubit(BuildContext context) =>
      BlocProvider.of(context);

  List<NoteModel> notesList = [];

  void getAllNotes() {
    Box<NoteModel> noteBox = Hive.box<NoteModel>(kNotesBox);
    notesList = noteBox.values.toList();
    emit(NotesRefresh());
  }
}
