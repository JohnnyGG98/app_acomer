import 'package:app_acomer/src/providers/carrito-provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class BottomCarrito extends StatelessWidget {
  const BottomCarrito({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CarritoProvider carritoProvider = Provider.of<CarritoProvider>(context);
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed('carrito');
      },
      child: Container(
        color: Theme.of(context).primaryColor,
        width: double.infinity,
        height: 60,
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text('${carritoProvider.numPlatos} platos',
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

      ),
    );
  }
}