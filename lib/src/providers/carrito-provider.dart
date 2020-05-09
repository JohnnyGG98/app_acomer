import 'package:app_acomer/src/models/plato/Plato.dart';
import 'package:flutter/material.dart';

class CarritoProvider with ChangeNotifier {

  int _numPlatos = 0;

  final List<Plato> _platos = new List(); 

  set numPlatos(int numPlatos) {
    _numPlatos = numPlatos;
    notifyListeners();
  }

  get numPlatos => this._numPlatos;

  void agregarPlato(Plato plato) {
    _platos.add(plato);
    numPlatos = _platos.length;
  }

}