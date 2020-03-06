import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Image.asset(
            'images/pokeball.png',
            width: 200,
            height: 200,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Dev.:',
                style: TextStyle(color: Colors.red),
              ),
              Text('Ariani Martins')
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Versão.:',
                style: TextStyle(color: Colors.red),
              ),
              Text('1.0')
            ],
          )
        ],
      ),
    );
  }
}
