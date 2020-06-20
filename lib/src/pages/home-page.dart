import 'package:app_acomer/src/models/plato/Plato.dart';
import 'package:app_acomer/src/pages/detalle-page.dart';
import 'package:app_acomer/src/providers/carrito-provider.dart';
import 'package:app_acomer/src/providers/platos-provider.dart';
import 'package:app_acomer/src/utils/c.dart';
import 'package:app_acomer/src/widgets/bottom-carrito.dart';
import 'package:app_acomer/src/widgets/imagen-plato.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    PlatoProvider platoProvider = Provider.of<PlatoProvider>(context);

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
              child: _getBody(context, platoProvider, screenSize),
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

  Widget _getBody(BuildContext context, PlatoProvider platoProvider, Size screenSize) {
    CarritoProvider carritoProvider = Provider.of<CarritoProvider>(context);

    return Container(
      decoration: BoxDecoration(
        color: Color.fromRGBO(236, 233, 222, 1),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50)
        )
      ),
      child: FutureBuilder(
        future: platoProvider.getPlatos(),
        builder: (BuildContext context, AsyncSnapshot<List<Plato>> snapshot) {
          if (snapshot.hasData) {
            final platos = snapshot.data;

            return GridView.builder(
              padding: EdgeInsets.symmetric(
                vertical: 20.0,
                horizontal: 30.0
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                childAspectRatio: 0.80
              ),
              itemCount: platos.length,
              itemBuilder: (BuildContext context, int i) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => DetallePage(idPlato: platos[i].id)
                      )
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor.withOpacity(0.85),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 5.0,
                          spreadRadius: 2.0,
                          offset: Offset(1,1.5, )
                        )
                      ]
                    ),
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child: Stack(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.all(Radius.circular(100)),
                                  child: ImagenPlato(urlImagen: platos[i].urlImagen,)
                                ),
                              ),

                              Positioned(
                                top: 5,
                                right: 5,
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                  child: Row(
                                    children: <Widget>[
                                      Icon(
                                        Icons.local_dining, 
                                        color: Colors.white,
                                        size: 14,
                                      ),
                                      Text(' 4.5', 
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14
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
                          ),
                        ),

                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          color: Theme.of(context).primaryColor,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                platos[i].nombre.length > 10 ?  
                                platos[i].nombre.substring(0, 10) + '...' : 
                                platos[i].nombre,
                                style: TextStyle(
                                  color: Colors.white
                                ),
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.shopping_cart,
                                  color: Colors.white,
                                ), 
                                onPressed: () {
                                  carritoProvider.agregarPlato(platos[i]);
                                }
                              )
                            ],
                          ),
                        ),

                        

                      ],
                    ),
                  ),
                );
              }
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

}