import 'package:flutter/material.dart';


class BottomCarrito extends StatelessWidget {
  const BottomCarrito({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      width: double.infinity,
      height: 60,
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text('3 platos',
            style: TextStyle(
              fontSize: 22,
              color: Colors.white
            ),
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart,
              color: Colors.white,
              size: 30,
            ), 
            onPressed: (){}
          )
        ],
      ),

    );
  }
}