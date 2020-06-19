import 'package:app_acomer/src/pages/detalle-page.dart';
import 'package:app_acomer/src/providers/platos-provider.dart';
import 'package:app_acomer/src/widgets/imagen-plato.dart';
import 'package:flutter/material.dart';

class PlatosRestaurantePage extends StatelessWidget {
  
  final String restaurante;
  final PlatoProvider platoProvider;
  final int idRestaurante;
  
  PlatosRestaurantePage(
    this.restaurante,
    this.platoProvider, 
    this.idRestaurante
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Platos | $restaurante'),
      ),
      body: FutureBuilder(
        future: platoProvider.getByRestaurante(
          idRestaurante: idRestaurante
        ),
        builder: (BuildContext context, AsyncSnapshot<List<Plato>> snapshot) {
          if ( snapshot.hasData ) {
            List platos = snapshot.data;

            if (platos.length > 0) {
              return ListView.builder(
                itemCount: platos.length,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
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
        height: 100,
        width: 100,
        child: ImagenPlato(urlImagen: plato.urlImagen,),
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