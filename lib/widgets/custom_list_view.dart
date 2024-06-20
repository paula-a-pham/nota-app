import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nota/cubits/notes_cubit/notes_cubit.dart';
import 'package:nota/widgets/note_item.dart';

class CustomListView extends StatelessWidget {
  const CustomListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        return ListView.separated(
            itemBuilder: (context, index) => NoteItem(
                  note: NotesCubit.getNotesCubit(context).notesList[index],
                ),
            separatorBuilder: (context, index) => const SizedBox(
                  height: 10.0,
                ),
            itemCount: NotesCubit.getNotesCubit(context).notesList.length);
      },
    );
  }
}
