import 'package:flutter/material.dart';
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
      body: const Padding(
        padding: EdgeInsets.all(15.0),
        child: CustomListView(),
      ),
      floatingActionButton: const CustomFloatingActionButton(),
    );
  }
}
