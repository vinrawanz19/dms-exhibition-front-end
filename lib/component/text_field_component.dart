import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

Widget customTextField(String text, TextEditingController controller,
    List validator, String hintText) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text, style: const TextStyle(color: Colors.black, fontSize: 16)),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            isDense: true,
            hintText: hintText,
            border: const OutlineInputBorder(),
          ),
          validator: MultiValidator([...validator]).call,
        )
      ],
    ),
  );
}
