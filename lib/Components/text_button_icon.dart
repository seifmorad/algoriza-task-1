import 'package:flutter/material.dart';
import 'circular.dart';
import 'mtext.dart';

class TextButtonIcon extends StatelessWidget {
  final String text;
  final IconData? iconData;

  const TextButtonIcon({Key? key, required this.text, this.iconData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Row(
        children: [
          MyText(label: text, textStyle: const TextStyle(
            fontSize: 16,
            color: Colors.black,
            fontWeight: FontWeight.normal,
          ),),
          const SizedBox(
            width: 4,
          ),
          CircularIcon(
            icon: iconData,
          ),
        ],
      ),
    );
  }
}
