import 'package:app_acomer/src/providers/carrito-provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CarritoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    CarritoProvider carritoProvider = Provider.of<CarritoProvider>(context);;

    return Scaffold(
      appBar: AppBar(
        title: Text('Carrito'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            child: Text(
              '\$ ${carritoProvider.total.toStringAsFixed(2)}',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 35,
                fontWeight: FontWeight.w700
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: carritoProvider.numPlatos,
              itemBuilder: (BuildContext context, int i) {
                final Plato plato = carritoProvider.platos[i];
                return ListTile(
                  title: Text(plato.nombre),
                  subtitle: Text(plato.precio.toStringAsFixed(2)),
                );
              }
            )
          )
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: carritoProvider.platos.length > 0 ? () {
          modalBottom(context, carritoProvider);
        } : null, 
        label: Row(
          children: <Widget>[
            Text('Enviar pedido '),
            Icon(Icons.restaurant)
          ],
        )
      ),
    );
  }

  void modalBottom(BuildContext context, CarritoProvider carritoProvider) {
    showModalBottomSheet(
      context: context, 
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 40),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                'Estamos por enviar tu pedido',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w600
                ),
              ),

              Divider(),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  RaisedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    color: Colors.red,
                    child: Text(
                      'Cancelar',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20
                      ),
                    ),
                  ),

                  RaisedButton(
                    onPressed: () {
                      carritoProvider.resetCarrito();
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Aceptar',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20
                      ), 
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      }
    );
  }

}