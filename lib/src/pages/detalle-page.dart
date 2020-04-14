import 'package:app_acomer/src/widgets/bottom-carrito.dart';
import 'package:flutter/material.dart';

class DetallePage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('Detalle'), 
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
            top: screenSize.height * 0.05,
            child: _getInfo(context, screenSize)
          ),

          Positioned(
            top: screenSize.height * 0.025,
            right: screenSize.height * 0.025,
            child: _getImagen(context, screenSize)
          ),

          Positioned(
            right: 0,
            top: screenSize.height * 0.32,
            child: _getIngredientes(context, screenSize)
          ),

          Positioned(
            left: 0,
            top: screenSize.height * 0.35,
            child: _getRestaurante(context, screenSize)
          ),

          Positioned(
            bottom: 0,
            // left: 0,
            child: _getBottomPlatos(context, screenSize)
          ),
          
            
        ],
      ),
      bottomNavigationBar: BottomCarrito(),
    );
  }

  Widget _getInfo(BuildContext context, Size screen) {
    return Container(
      width: screen.width * 0.40,
      height: screen.height * 0.35,
      padding: EdgeInsets.symmetric(horizontal: 15),
      color: Theme.of(context).primaryColorLight,
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 20,),
          Text('Hamburguesa', 
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          Divider(),

          RaisedButton(
            onPressed: ( ) {},
            child: Text('Ver menu', 
              style: TextStyle(
                color: Colors.white,
                fontSize: 16
              ),
            ),
          ),

          Text('Puedes personalizar el plato a su gusto. Selecionando los ingrdientes que más le guste.',
            textAlign: TextAlign.justify,
          )
        ],
      ),
    );
  }

  Widget _getImagen(BuildContext context, Size size) {
    return Container(
      width: size.width * 0.55,
      height: size.width * 0.60,
      child: Stack(
        children: <Widget>[
          Container(
            width: size.width * 0.55,
            height: size.width * 0.55,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(25)),
              child: Image.network(
                'https://images.pexels.com/photos/1639557/pexels-photo-1639557.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 
                fit: BoxFit.cover,
              ),
            ),
          ),

          Positioned(
            top: 15,
            right: 15,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Row(
                children: <Widget>[
                  Icon(Icons.local_dining, color: Colors.white,),
                  Text(' 3.5', 
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20
                    ),
                  )
                ],
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).accentColor.withOpacity(0.8),
                borderRadius: BorderRadius.circular(15)
              ),
            )
          ),

          Positioned(
            left: (size.width * 0.55) / 4,
            right: (size.width * 0.55) / 4,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).accentColor.withOpacity(0.8),
                borderRadius: BorderRadius.circular(15)
              ),
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text('\$ 3.50', 
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1
                ),
                textAlign: TextAlign.center,
              ),
            )
          )

        ],
      ),
    );
  }

  Widget _getIngredientes(BuildContext context, Size size) {
    return Container(
      height: size.height * 0.50,
      width: size.width * 0.70,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColorLight,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(15)),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 5.0, // has the effect of softening the shadow
            spreadRadius: 3.0, // has the effect of extending the shadow
            offset: Offset(
              -4, // horizontal, move right 10
              0, // vertical, move down 10
            ),
          )
        ],
      ),
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: new List.generate(10, (i) => i < 7 ? 
              Icon(Icons.local_dining, color: Theme.of(context).primaryColor,) : 
              Icon(Icons.local_dining,color: Theme.of(context).accentColor,)
            ),
          ),
          Text('Puntua aqui',
            style: TextStyle(fontSize: 12),
          ),
          Divider(),
          Text('Ingredientes', 
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold
            ),
          ),

          SizedBox(height: 10,),

          Container(
            height: size.height * 0.20,
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: 25,
                      height: 25,
                      child: Checkbox(
                        activeColor: Theme.of(context).primaryColor,
                        value: true, 
                        onChanged: (newValue) {}
                      ),
                    ),
                    Text('Tomate')
                  ],
                ),
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: 25,
                      height: 25,
                      child: Checkbox(
                        activeColor: Theme.of(context).primaryColor,
                        value: true, 
                        onChanged: (newValue) {}
                      ),
                    ),
                    Text('Lechuga')
                  ],
                ),
              ],
            ),
          ),

          SizedBox(height: 5,),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                color: Theme.of(context).accentColor,
                child: Text('Agregar',
                  style: TextStyle(
                    color: Colors.white
                  ),
                ),
              )
            ],
          )
        ],

      ),
    );
  }

  Widget _getRestaurante(BuildContext context, Size size) {
    return Container(
      height: size.height * 0.50,
      margin: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      child: Column(
        children: <Widget>[
          Container(
            color: Colors.black26,
            height: size.width * 0.20,
            width: size.width * 0.20,
            child: Image.network(
              'https://images.pexels.com/photos/1162361/pexels-photo-1162361.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: (size.height * 0.30) - (size.width * 0.20),
            width: size.width * 0.20,
            decoration: BoxDecoration(
              color: Theme.of(context).accentColor,
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(15))
            ),
            child: Text(_getTextColumn('ROUTE 66'),
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
              textAlign: TextAlign.center,
            ),
            padding: EdgeInsets.symmetric(vertical: 20),
          )
        ],
      ),
    );
  }

  String _getTextColumn(String text) {
    String col = '';
    for (var i = 0; i < text.length; i++) {
      col += text[i] + '\n';
    }
    return col;
  }

  Widget _getBottomPlatos(BuildContext context, Size size) {
    return Container(
      height: size.height * 0.15,
      width: size.width,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColorLight.withOpacity(0.50),
        // color: Colors.red,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(25))
      ),
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        children: <Widget>[
          _getPlatoBottom(context, size),
          SizedBox(width: 15,),
          _getPlatoBottom(context, size),
          SizedBox(width: 15,),
          _getPlatoBottom(context, size),
          SizedBox(width: 15,),
          _getPlatoBottom(context, size),
          SizedBox(width: 15,),
        ],
      ),
    );
  }

  Widget _getPlatoBottom(BuildContext context, Size size) {
    return Container(
      width: size.height * 0.15,
      height: size.height * 0.08,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          bottomLeft: Radius.circular(15)
        ),
        color: Colors.white
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Stack(
              children: <Widget>[
                Container(
                  width: size.height * 0.12,
                  height: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      bottomLeft: Radius.circular(15)
                    ),
                    child: Image.network(
                      'https://images.pexels.com/photos/1639557/pexels-photo-1639557.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                Positioned(
                  top: 5,
                  right: 5,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 2.5, vertical: 5),
                    child: Column(
                      children: <Widget>[
                        Icon(
                          Icons.local_dining, 
                          color: Colors.white,
                          size: 14,
                        ),
                        Text(' 3.5', 
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10
                          ),
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context).accentColor.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(15)
                    ),
                  )
                ),

              ],
            )
          ),
          Container(
            color: Theme.of(context).primaryColor,
            height: double.infinity,
            width: size.height * 0.03,
            child: Text(_getTextColumn('MAS'), 
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            padding: EdgeInsets.symmetric(vertical: size.height * 0.02),
          )
        ],
      ),
    );
  }

}