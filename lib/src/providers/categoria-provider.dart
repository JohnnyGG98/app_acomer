
import 'dart:convert';

import 'package:app_acomer/src/models/categoria/Categoria.dart';
import 'package:app_acomer/src/utils/c.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';

export 'package:app_acomer/src/models/categoria/Categoria.dart';

class CategoriaProvider with ChangeNotifier {

  String _url = '${BASE_URL}api/v1/categoria';
  
  Future<List<Categoria>> _mapearCategorias(String url) async {
    final res = await http.get(url, headers: TOKE_HEADER);
    print(url);
    final data = json.decode(res.body);
    final List<dynamic> list = data['data'];
    
    List<Categoria> platos = new List();
    list.forEach((l) {
      final p = Categoria.fromJSONMap(l);
      platos.add(p);
    });
    return platos;
  }

  Future<List<Categoria>> getCategorias({int page:1}) async {
    String url = '$_url?page=$page';
    
    return _mapearCategorias(url);
  }

  Future<List<Categoria>> getByRestaurante(int idRestaurante) async {
    String url = '$_url/restaurante/$idRestaurante';
    
    return _mapearCategorias(url);
  }

}