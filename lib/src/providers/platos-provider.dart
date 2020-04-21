import 'dart:convert';

import 'package:app_acomer/src/models/plato/Plato.dart';
import 'package:app_acomer/src/utils/c.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class PlatoProvider with ChangeNotifier {
  
  String _url = '${BASE_URL}api/v1/plato';
  List<Plato> _platosHome;

  set platosHome (List<Plato> platos) {
    _platosHome = platos;
    notifyListeners();
  }

  get platosHome => this._platosHome;

  Future<List<Plato>> _mapearPlatos(String url) async {
    final res = await http.get(url);
    final data = json.decode(res.body);
    final List<dynamic> list = data['data'];
    
    List<Plato> platos = new List();
    list.forEach((l) {
      final p = Plato.fromJSONMap(l);
      platos.add(p);
    });

    platosHome = platos;
    return platos;
  }

  Future<List<Plato>> getPlatos({int page}) async {
    if (_platosHome == null) return _platosHome;

    String url = '$_url?page=$page';
    return _mapearPlatos(url);
  }

  Future<List<Plato>> getPlatosRestaurante({
    int page, 
    int idRestaurante
  }) async {
    String url = '$_url/restaurante/$idRestaurante?page=$page';
    return _mapearPlatos(url);
  }

}