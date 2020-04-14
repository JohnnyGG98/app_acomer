import 'package:app_acomer/src/widgets/bottom-carrito.dart';
import 'package:flutter/material.dart';

class RestaurantePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('Detalle'), 
      ),
      body: Stack(
        children: <Widget>[
          _getTopInfo(context, screenSize),
          Positioned(
            top: screenSize.height * 0.55,
            bottom: 0,
            child: _getMenu(context, screenSize),
          )
        ],
      ),
      bottomNavigationBar: BottomCarrito(),
    );
  }

  Widget _getTopInfo(BuildContext context, Size size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 20,),
        Container(
          width: size.width * 0.85,
          height: size.height * 0.20,
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(15),
              bottomRight: Radius.circular(15)
            ),
            child: Image.network(
              'https://images.pexels.com/photos/1162361/pexels-photo-1162361.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
              fit: BoxFit.cover,
            ),
          ),
        ),

        Container(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(Icons.my_location),
                  SizedBox(width: 15,),
                  Text('Como llegar')
                ],
              ),

              SizedBox(height: 10,),

              Text('Route 66',
                style: TextStyle(
                  fontSize: 24,
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold
                ),
                textAlign: TextAlign.start,
              ),
              Divider(),

            ],

          )
        ),

        _getCategorias(context, size),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: _getMenuDia(context, size),
        )

      ],
    );
  }

  Widget _getCategorias(BuildContext context, Size size) {
    return Container(
      height: size.height * 0.07,
      // color: Colors.red,
      child: ListView(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          _getCategoria(context, 'Comida rapida'),
          SizedBox(width: 15,),
          _getCategoria(context, 'Comida sierra'),
          SizedBox(width: 15,),
          _getCategoria(context, 'Platos a la carta'),
          SizedBox(width: 15,),
          _getCategoria(context, 'Platos a la carta'),
          SizedBox(width: 15,),
        ],
      ),
    );
  }

  Widget _getCategoria(BuildContext context, String cate) {
    return Container(
      width: 100,
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 7),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Theme.of(context).accentColor
      ),
      child: Center(
        child: Text(cate,
          style: TextStyle(
            color: Colors.white
          ),
          textAlign: TextAlign.center,
        ), 
      )
    );
  }

  Widget _getMenuDia(BuildContext context, Size size) {
    return Container(
      height: size.height * 0.12,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(bottomRight: Radius.circular(25)),
        color: Theme.of(context).primaryColorLight,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 5.0, 
            spreadRadius: 3.0,
            offset: Offset(4, 4,),
          )
        ],
      ),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        child: Row(
          children: <Widget>[
            Expanded(
              child: ListView(
                children: <Widget>[
                  Text('HDADWD'),
                  Text('HDADWD'),
                  Text('HDADWD'),
                  Text('HDADWD'),
                  Text('HDADWD'),
                ],
              )
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('\$ 25.0', 
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 24,
                      fontWeight: FontWeight.bold
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 25,
                        width: 60,
                        color: Colors.white,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        height: 25,
                        color: Theme.of(context).accentColor,
                        child: Center(
                          child: Text('Agregar', 
                            style: TextStyle(
                              color: Colors.white
                            ),
                          ),
                        )
                      )
                    ],
                  )
                ],
              )
            )
          ],

        ),
      )
    );
  }

  Widget _getMenu(BuildContext context, Size size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          // color: Colors.white,
          child: Text('Menu', 
            style: TextStyle(
              fontSize: 18
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: size.height,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColorLight,
              borderRadius: BorderRadius.vertical(top: Radius.circular(25))
            ),
            child: Row(

            ),
          )
        )
      ],
    );
  }

}