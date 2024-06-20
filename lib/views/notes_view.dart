import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nota/cubits/notes_cubit/notes_cubit.dart';
import 'package:nota/widgets/custom_floating_action_button.dart';
import 'package:nota/widgets/custom_list_view.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nota'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: BlocBuilder<NotesCubit, NotesState>(
          builder: (context, state) {
            return const CustomListView();
          },
        ),
      ),
      floatingActionButton: const CustomFloatingActionButton(),
    );
  }
}
