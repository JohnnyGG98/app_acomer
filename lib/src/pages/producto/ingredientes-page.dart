import 'package:app_acomer/src/providers/carrito-provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IngredientesPage extends StatefulWidget {

  final Plato plato;

  IngredientesPage(this.plato);

  @override
  _IngredientesPageState createState() => _IngredientesPageState();
}

class _IngredientesPageState extends State<IngredientesPage> {

  CarritoProvider _carritoProvider;
  
  @override
  Widget build(BuildContext context) {
    _carritoProvider = Provider.of<CarritoProvider>(context);
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
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
            children: new List.generate(10, (i) => 
              GestureDetector(
                onTap: () {
                  setState(() {
                    widget.plato.puntuacion = i + 1;
                  });
                },
                child: Icon(
                  Icons.local_dining, 
                  color: i < widget.plato.puntuacion ? 
                    Theme.of(context).primaryColor :
                    Theme.of(context).accentColor,
                ),
              )
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
            height: 200,
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: widget.plato.estadoIngredientes.length,
              itemBuilder: (BuildContext context, int index) {
                IngredienteEstado ingrediente = widget.plato.estadoIngredientes[index];
                return Row(
                  children: <Widget>[
                    SizedBox(
                      width: 25,
                      height: 25,
                      child: Checkbox(
                        activeColor: Theme.of(context).primaryColor,
                        value: ingrediente.agregado, 
                        onChanged: (newValue) {
                          setState(() {
                            ingrediente.agregado = !ingrediente.agregado;
                          });
                        }
                      ),
                    ),
                    Text(
                      ingrediente.ingredienteFixed
                    )
                  ],
                );
              },
            ),
          ),

          SizedBox(height: 5,),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                color: Theme.of(context).accentColor,
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: GestureDetector(
                    onTap: () {
                      _carritoProvider.agregarPlato(widget.plato);
                    },
                    child: Text('Agregar',
                    style: TextStyle(
                      color: Colors.white
                    ),
                  ),
                ),
              )
            ],
          )
        ],

      ),
    );
  }

}