import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:nota/cubits/notes_cubit/notes_cubit.dart';
import 'package:nota/widgets/edit_note_bottom_sheet.dart';
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
            itemBuilder: (context, index) => Slidable(
                  startActionPane: ActionPane(
                    motion: const ScrollMotion(),
                    children: <Widget>[
                      SlidableAction(
                        onPressed: (context) {
                          NotesCubit.getNotesCubit(context)
                              .notesList[index]
                              .delete();
                          NotesCubit.getNotesCubit(context).getAllNotes();
                        },
                        borderRadius: BorderRadius.circular(8.0),
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        icon: Icons.delete_rounded,
                        label: 'Delete',
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                    ],
                  ),
                  child: GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) => EditNoteBottomSheet(
                          note: NotesCubit.getNotesCubit(context)
                              .notesList[index],
                        ),
                        isScrollControlled: true,
                      );
                    },
                    child: NoteItem(
                      note: NotesCubit.getNotesCubit(context).notesList[index],
                    ),
                  ),
                ),
            separatorBuilder: (context, index) => const SizedBox(
                  height: 10.0,
                ),
            itemCount: NotesCubit.getNotesCubit(context).notesList.length);
      },
    );
  }
}
