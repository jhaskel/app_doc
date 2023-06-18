
import 'package:flutter/material.dart';

class Texxto extends StatelessWidget {

  String text ;
  double size;

  Texxto({required this.text,this.size = 12});

  @override
  Widget build(BuildContext context) {
    return SelectableText(

      text,
      showCursor: true,
      style: TextStyle(
          fontSize: size,

      ),
    );
  }
}