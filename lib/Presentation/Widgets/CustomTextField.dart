import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key,
      this.validator,
      this.onChanged,
      this.hinttext,
      this.obscureText,
      this.icon,
      this.type});
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final String? hinttext;
  final bool? obscureText;
  final IconData? icon;
  final TextInputType? type;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: TextFormField(
          obscureText: obscureText!,
          cursorColor: Colors.white,
          decoration: InputDecoration(
              prefixIcon: Icon(
                icon,
                color: Colors.white,
              ),
              fillColor: Colors.redAccent,
              filled: true,
              hintText: hinttext!,
              hintStyle: TextStyle(color: Colors.white),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(20)),
              disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(20)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(20)),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(20))),
          validator: validator,
          onChanged: onChanged),
    );
  }
}
