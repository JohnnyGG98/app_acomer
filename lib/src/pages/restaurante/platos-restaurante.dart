import 'package:flutter/material.dart';

class PlatosRestaurantePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Platos | Rest'),
      ),
      body: Column(
        children: <Widget>[
          Text('Rest'),
          Expanded(
            child: ListView(
              children: <Widget>[
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
              ],
            )
          )
        ],
      ),
    );
  }
}