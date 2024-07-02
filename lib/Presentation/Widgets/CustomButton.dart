import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({super.key, this.onPressed, this.text, this.color});
  final VoidCallback? onPressed;
  final String? text;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width * 0.4,
      child: MaterialButton(
          onPressed: onPressed,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          color: color,
          child: Text(
            text!,
            style: TextStyle(color: Colors.white),
          )),
    );
  }
}
