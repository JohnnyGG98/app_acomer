import 'package:app_acomer/src/pages/detalle-page.dart';
import 'package:app_acomer/src/pages/restaurante/menu-dia-restaurante.dart';
import 'package:app_acomer/src/pages/restaurante/platos-restaurante.dart';
import 'package:app_acomer/src/providers/carrito-provider.dart';
import 'package:app_acomer/src/providers/categoria-provider.dart';
import 'package:app_acomer/src/providers/platos-provider.dart';
import 'package:app_acomer/src/providers/restaurante/menu-dia-provider.dart';
import 'package:app_acomer/src/providers/restaurantes-provider.dart';
import 'package:app_acomer/src/widgets/bottom-carrito.dart';
import 'package:app_acomer/src/widgets/imagen-plato.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RestaurantePage extends StatefulWidget {

  final MenuDiaProvider _menuDiaProvider = new MenuDiaProvider();
  final idRestaurante; 

  RestaurantePage({@required this.idRestaurante});

  @override
  _RestaurantePageState createState() => _RestaurantePageState();
}

class _RestaurantePageState extends State<RestaurantePage> {
  
  RestauranteProvider _restauranteProvider;
  PlatoProvider _platoProvider;
  Restaurante _restaurante;
  CarritoProvider _carritoProvider;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    _restauranteProvider = Provider.of<RestauranteProvider>(context);
    _platoProvider = Provider.of<PlatoProvider>(context);
    _carritoProvider = Provider.of<CarritoProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Restaurante ${widget.idRestaurante}'), 
      ),
      body: FutureBuilder(
        future: _restauranteProvider.getOne(widget.idRestaurante),
        builder: (BuildContext context, AsyncSnapshot<Restaurante> snapshot) {
          if ( snapshot.hasData ) {
            _restaurante = snapshot.data;
            return SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  _getTopInfo(context, screenSize),
                  _getMenuTitle(context),
                  _getMenu(context, screenSize)
                ],
              ),
            );
          } 
          
          if ( snapshot.hasError ) {
            return Center(
              child: Text('No encontramos lo que buscaba!'),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
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
          width: 350,
          height: 180,
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

              Text(_restaurante.nombreComercial,
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
          child: _findFirstMenu(context, size),
        )

      ],
    );
  }

  Widget _getCategorias(BuildContext context, Size size) {
    CategoriaProvider provider = Provider.of<CategoriaProvider>(context);

    return Container(
      height: 70,
      child: FutureBuilder(
        future: provider.getByRestaurante(widget.idRestaurante),
        builder: (BuildContext context, AsyncSnapshot<List<Categoria>> snapshot) {
          if ( snapshot.hasData ) {
            List<Categoria> categorias = snapshot.data;
            if (categorias.length > 0) {
              return ListView.builder(
                itemCount: categorias.length,
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return Row(
                    children: <Widget>[
                      _getCategoria(context, categorias[index].nombre),
                      SizedBox(width: 15,)
                    ],
                  );
                }
              );
            } else {
              return Center(
                child: Text('Este restaurante no tiene categorias.'),
              );
            }
          }

          if ( snapshot.hasError ) {
            return Center(
              child: Text('Error al buscar'),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      )
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

  Widget _findFirstMenu(BuildContext context, Size size) {
    return FutureBuilder(
      future: widget._menuDiaProvider.getOneByRestaurante(widget.idRestaurante),
      builder: (BuildContext context, AsyncSnapshot<MenuDia> snapshot) {
        if (snapshot.hasData) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => MenuDiaRestaurantePage(
                    _restaurante.nombreComercial,
                    widget._menuDiaProvider,
                    widget.idRestaurante
                  )
                )
              );
            },
            child: _getMenuDia(
              context, 
              size,
              snapshot.data
            ),
          );
        }

        if (snapshot.hasError) {
          return Center(
            child: Text('No encontramos nada.'),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
  
  
  Widget _getMenuDia(
    BuildContext context, 
    Size size,
    MenuDia menu
  ) {
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
              child: ListView.builder(
                itemCount: menu.menu.length,
                itemBuilder: (BuildContext context, int index) {
                  return Text(menu.menu[index]);
                },
              )
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('\$ ${menu.precio.toStringAsFixed(2)}', 
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

  Widget _getMenuTitle(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => PlatosRestaurantePage(
              _restaurante.nombreComercial,
              _platoProvider,
              widget.idRestaurante
            )
          )
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        width: double.infinity,
        child: Text('Menu', 
          style: TextStyle(
            fontSize: 18
          ),
          textAlign: TextAlign.left,
        ),
      ),
    );
  }

  Widget _getMenu(BuildContext context, Size size) {
    return Container(
      width: double.infinity,
      height: 500,
      child: FutureBuilder(
        future: _platoProvider.getByRestaurante(
          idRestaurante: widget.idRestaurante
        ),
        builder: (BuildContext context, AsyncSnapshot<List<Plato>> snapshot) {
          if ( snapshot.hasData ) {
            List platos = snapshot.data;

            if (platos.length > 0) {
              return ListView.builder(
                itemCount: platos.length,
                padding: EdgeInsets.symmetric(horizontal: 15),
                itemBuilder: (BuildContext context, int index) {
                  return _getPlatoMenu(context, platos[index]);
                }
              );
            } else {
              return Center(
                child: Text('No tenemos platos en este restaurante'),
              );
            }
          }

          if ( snapshot.hasError ) {
            return Center(
              child: Text('No pudimos encontrar platos...'),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        }
      )
    );
  }

  Widget _getPlatoMenu(BuildContext context, Plato plato) {
    return ListTile(
      leading: Container(
        height: 60,
        width: 60,
        child: ImagenPlato(urlImagen: plato.urlImagen,),
      ),
      trailing: IconButton(
        icon: Icon(
          Icons.shopping_cart,
          color: Theme.of(context).primaryColor,
        ),
        onPressed: () {
          _carritoProvider.agregarPlato(plato);
        },
      ),
      title: Text(plato.nombre),
      subtitle: Text('\$${plato.precio.toStringAsFixed(2)}'),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => DetallePage(idPlato: plato.id)
          )
        );
      },
    );
  }

}