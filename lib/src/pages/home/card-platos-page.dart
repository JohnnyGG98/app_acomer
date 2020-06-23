import 'package:app_acomer/src/pages/detalle-page.dart';
import 'package:app_acomer/src/providers/carrito-provider.dart';
import 'package:app_acomer/src/providers/platos-provider.dart';
import 'package:app_acomer/src/widgets/imagen-plato.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardPlatosPage extends StatefulWidget {
  @override
  _CardPlatosPageState createState() => _CardPlatosPageState();
}

class _CardPlatosPageState extends State<CardPlatosPage> {

  ScrollController _scrollController;
  bool _cargando = false;
  int _page = 1;
  PlatoProvider platoProvider;

  @override
  void initState() {
    _scrollController = new ScrollController();
    _scrollController.addListener(() {
      if (
        _scrollController.position.pixels >= (_scrollController.position.maxScrollExtent - 70)
      ) {
        if (!_cargando) {
          _cargando = true;
          _loadPlatos();
        }
      }
    });
    
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    platoProvider?.disposeStreams();
    super.dispose();
  }

  _loadPlatos() async {
    await platoProvider.getForInfinityScroll(
      page: _page
    );
    _page++;
    _cargando = false;
  }

  @override
  Widget build(BuildContext context) {
    CarritoProvider carritoProvider = Provider.of<CarritoProvider>(context);
    platoProvider = Provider.of<PlatoProvider>(context);

    if (_page == 1) {
      _loadPlatos();
      _cargando = true;
    }

    return Container(
      decoration: BoxDecoration(
        color: Color.fromRGBO(236, 233, 222, 1),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50)
        )
      ),
      child: StreamBuilder(
        stream: platoProvider.allPlatosStream,
        builder: (BuildContext context, AsyncSnapshot<List<Plato>> snapshot) {
          if (snapshot.hasData) {
            final platos = snapshot.data;

            return GridView.builder(
              controller: _scrollController,
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
                                platos[i].nombre.length > 8 ?  
                                platos[i].nombre.substring(0, 8) + '...' : 
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