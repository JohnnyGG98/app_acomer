import 'package:app_acomer/src/models/plato/Plato.dart';
import 'package:flutter/material.dart';

export 'package:app_acomer/src/models/plato/Plato.dart';

class CarritoProvider with ChangeNotifier {

  int _numPlatos = 0;

  final List<Plato> _platos = new List(); 

  List<Plato> get platos => _platos;

  set numPlatos(int numPlatos) {
    _numPlatos = numPlatos;
    notifyListeners();
  }

  get numPlatos => this._numPlatos;

  void agregarPlato(Plato plato) {
    _platos.add(plato);
    numPlatos = _platos.length;
  }

  void resetCarrito() {
    _platos.clear();
    _numPlatos = 0;
    notifyListeners();
  }

  double get total {
    double suma = 0;
    _platos.forEach((p) {
      suma += p.precio;
    });
    return suma;
  }

}