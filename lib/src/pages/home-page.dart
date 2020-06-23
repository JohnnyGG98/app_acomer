import 'package:app_acomer/src/pages/home/card-platos-page.dart';
import 'package:app_acomer/src/utils/c.dart';
import 'package:app_acomer/src/widgets/bottom-carrito.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('Inicio'),
      ),
      body: Column(
        children: <Widget>[
          Cons.userLogueado ? 
          Container(
            height: 160,
            child: _getTop(screenSize),
          ) : Container(
            height: 15,
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            child: Text('Lo más comprado:',
              style: TextStyle(
                fontSize: 16,
              ),
              textAlign: TextAlign.left,
            )
          ),
          Expanded(
            child: InkWell(
              child: CardPlatosPage(),
              splashColor: Colors.transparent,
            )
          )  
        ],
      ),

      // floatingActionButton: ,
      bottomNavigationBar: BottomCarrito(),
    );
  }

  Widget _getTop(Size size) {
    return Stack(
      children: <Widget>[
        _getOpcionesTop(size),
        Positioned(
          top: 50,
          left: 25,
          right: 25,
          child: Container(
            height: 100,
            decoration: BoxDecoration(
              color: Color.fromRGBO(236, 233, 222, 1),
              borderRadius: BorderRadius.all(Radius.circular(25))
            ),
            child: Row(
              children: <Widget>[
                Container(
                  height: 80,
                  width: 80,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15))
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    child: Image.network(
                      'https://images.pexels.com/photos/376464/pexels-photo-376464.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=340&w=690', 
                      fit: BoxFit.cover,
                      
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          child: ListView(
                            children: <Widget>[
                              Text(
                                '1 hot cake \n'
                                '2 cafes \n'
                                '1 tamal \n'
                                '2 croasam\n'
                                '1 tostada\n'
                                '3 batidos de mora'
                              ),
                            ],
                          )
                        ),
                        
                        GestureDetector(
                          onTap: (){},
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 15),
                            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(15)),
                              color: Color.fromRGBO(14, 70, 85, 1),
                            ),
                            // width: double.infinity,
                            child: Text('Reservar de nuevo', 
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),

      ],
    );
  }

  Widget _getOpcionesTop(Size size) {
    return Positioned(
      top: 10,
      child: Container(
        height: 75,
        width: size.width * 0.75,
        decoration: BoxDecoration(
          color: Color.fromRGBO(236, 233, 222, 0.5),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(25),
            bottomRight: Radius.circular(25)
          )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,

          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 10.0, top: 10.0),
              child: Text('Ultimas compras:', 
                style: TextStyle(fontSize: 16),
              ),
            ),
            GestureDetector(
              onTap: () {}, 
              child: Container(
                margin: EdgeInsets.only(top: 5, right: 15),
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  color: Color.fromRGBO(14, 70, 85, 1),
                ),
                child: Text('Ver todas', 
                  style: TextStyle(color: Colors.white),
                ),
              )
            )
          ],
        ),
      )
    );
  }

}