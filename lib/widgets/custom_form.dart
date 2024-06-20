import 'package:flutter/material.dart';
import 'package:nota/widgets/custom_filled_button.dart';
import 'package:nota/widgets/custom_text_form_field.dart';

class CustomForm extends StatefulWidget {
  const CustomForm({
    super.key,
    required this.onPressed,
  });

  final Function(dynamic data) onPressed;

  @override
  State<CustomForm> createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  final GlobalKey<FormState> formKey = GlobalKey();

  final TextEditingController titleController = TextEditingController();

  final TextEditingController subTitleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          CustomTextFormField(
            textEditingController: titleController,
            maxLines: 1,
            fontSize: 20,
            hintText: 'Title',
          ),
          CustomTextFormField(
            textEditingController: subTitleController,
            maxLines: 5,
            fontSize: 15,
            hintText: 'Sub Title',
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: CustomFilledButton(
                    onPressed: () {
                      widget.onPressed('');
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
