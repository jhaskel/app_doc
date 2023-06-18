import 'package:flutter/material.dart';

class AcessoNegado extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
              'assets/img/Proibido.jpg',
              height: 150,
              width: 150,
          ),
          SizedBox(height: 15),
          Text(
            'Acesso Restrito!',
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
