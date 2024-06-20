import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:nota/constants/constants.dart';
import 'package:nota/cubits/bloc_observer.dart';
import 'package:nota/models/note_model.dart';
import 'package:nota/views/notes_view.dart';

void main() async {
  Bloc.observer = MyBlocObserver();

  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(kNotesBox);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nota',
      theme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: 'Poppins',
        useMaterial3: true,
      ),
      home: const NotesView(),
    );
  }
}
