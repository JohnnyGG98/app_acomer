import 'dart:convert';

import 'package:app_acomer/src/models/restaurante/Restaurante.dart';
import 'package:app_acomer/src/utils/c.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

export 'package:app_acomer/src/models/restaurante/Restaurante.dart';

class RestauranteProvider with ChangeNotifier{

  String _url = '${BASE_URL}api/v1/restaurante';
  List<Restaurante> _restauranteHome;

  set restauranteHome(List<Restaurante> restaurantes){
    _restauranteHome = restaurantes;
    notifyListeners();
  }

  get restaurantesHome => this._restauranteHome;

  Future <List<Restaurante>> _mapearRestaurantes(String url) async {
    final res = await http.get(url, headers: TOKE_HEADER);
    final data = json.decode(res.body);
    final List<dynamic> list = data['data'];

    List <Restaurante> restaurantes = new List();
    list.forEach((l) {
      final p = Restaurante.fromJSONMap(l);
      restaurantes.add(p);
    });

    restauranteHome = restaurantes;
    return restaurantes;
  }

  Future <List<Restaurante>> getRestaurantes({int page}) async {
    String url = '$_url?page=$page';
    return _mapearRestaurantes(url);
  }

  Future<Restaurante> getOne(int idRestaurante) async {
    String url = '$_url/$idRestaurante';
    final res = await http.get(url, headers: TOKE_HEADER);
    final data = json.decode(res.body);
    final Map<String, dynamic> body = data['data']; 
    
    return Restaurante.fromJSONMap(body);
  }


}