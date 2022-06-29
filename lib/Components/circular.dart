import 'package:flutter/material.dart';

class CircularIcon extends StatelessWidget {
  final IconData? icon;
  const CircularIcon({
    Key? key,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.teal,
      radius: 12,
      child: Icon(
        icon ?? Icons.question_mark_sharp,
        size: 18,
        color: Colors.white,
      ),
    );
  }
}
