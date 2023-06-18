import 'package:flutter/material.dart';

class NoDataWidget extends StatelessWidget {

  String text ;

  NoDataWidget({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
              'assets/img/cero-items.png',
              height: 150,
              width: 150,
          ),
          SizedBox(height: 15),
          SelectableText(

            text,
            showCursor: true,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold
            ),
          )
        ],
      ),
    );
  }
}
