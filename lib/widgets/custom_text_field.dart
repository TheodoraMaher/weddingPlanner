import 'package:flutter/material.dart';

class CustomFormTextField extends StatelessWidget {
  CustomFormTextField({this.hintText, this.onChanged , this.obscureText =false});
  Function(String)? onChanged;
  String? hintText;
  bool? obscureText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText:obscureText!,
      validator: (data) {
        if (data!.isEmpty) {
          return 'field is required';
        }
      },
      onChanged: onChanged,
      decoration: InputDecoration(
        // byt8yr m3 t8yor al textfield
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.black,
        ),
        // by5lene lma bdos 3l border lono bykon white
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
        // da al7ala al3ama bta3t al border mn 8er ma ad8t 3leh
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
