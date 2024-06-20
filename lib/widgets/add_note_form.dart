import 'package:flutter/material.dart';
import 'package:nota/models/note_model.dart';
import 'package:nota/widgets/custom_filled_button.dart';
import 'package:nota/widgets/custom_text_form_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
    required this.onPressed,
  });

  final Function(NoteModel note) onPressed;

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  final TextEditingController titleController = TextEditingController();

  final TextEditingController subTitleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          CustomTextFormField(
            textEditingController: titleController,
            maxLines: 1,
            fontSize: 20,
            hintText: 'Title',
          ),
          const SizedBox(
            height: 10.0,
          ),
          CustomTextFormField(
            textEditingController: subTitleController,
            maxLines: 5,
            fontSize: 15,
            hintText: 'Sub Title',
          ),
          const SizedBox(
            height: 10.0,
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: CustomFilledButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        NoteModel note = NoteModel(
                            title: titleController.text,
                            subTitle: subTitleController.text,
                            color: Colors.transparent.value);
                        widget.onPressed(note);
                      } else {
                        setState(() {
                          autovalidateMode = AutovalidateMode.always;
                        });
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
    );
  }
}
