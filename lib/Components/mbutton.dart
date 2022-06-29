import 'package:flutter/material.dart';
import '../../extensions.dart';

class MyButton extends StatelessWidget {
  final String text;
  final double borderSize;
  final VoidCallback onPressed;
  final double? width;
  final double? height;
  final Color? btnColor;
  final Color? txtColor;

  const MyButton(
      {Key? key,
        required this.text,
        this.borderSize = 12,
        required this.onPressed,
        this.width,
        this.height,
        this.btnColor,
        this.txtColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? context.width,
      height: height ?? 52,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderSize),
          ),
          primary: Colors.teal,
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
