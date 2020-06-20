import 'package:app_acomer/src/providers/restaurante/menu-dia-provider.dart';
import 'package:flutter/material.dart';

class MenuDiaRestaurantePage extends StatelessWidget {
  
  final String restaurante;
  final MenuDiaProvider menuDiaProvider;
  final int idRestaurante;

  MenuDiaRestaurantePage(
    this.restaurante,
    this.menuDiaProvider,
    this.idRestaurante
  );
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menú día | $restaurante'),
      ),
      body: FutureBuilder(
        future: menuDiaProvider.getByRestaurante(idRestaurante),
        builder: (BuildContext context, AsyncSnapshot<List<MenuDia>> snapshot) {

          if (snapshot.hasData) {
            final List<MenuDia> menus = snapshot.data;
            return Container(
              height: double.infinity,
              child: ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                itemCount: menus.length,
                itemBuilder: (BuildContext context, int index) {
                  return _getMenuDia(context, menus[index]);
                }
              ),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text('No encotramos menus...'),
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

  Widget _getMenuDia(BuildContext context, MenuDia menu) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15),
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(25)),
          color: Theme.of(context).primaryColorLight,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 5.0,
              spreadRadius: 3.0,
              offset: Offset(4,4, )
            )
          ]
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
                    Text(
                      menu.descripcion,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),

                    Divider(),

                    Text('\$ ${menu.precio.toStringAsFixed(2).substring(0, 2)}', 
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
      ),
    );
  }

}