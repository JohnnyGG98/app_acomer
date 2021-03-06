import 'dart:async';
import 'dart:convert';

import 'package:app_acomer/src/models/plato/Plato.dart';
import 'package:app_acomer/src/utils/c.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

export 'package:app_acomer/src/models/plato/Plato.dart';

class PlatoProvider with ChangeNotifier {
  
  String _url = '${BASE_URL}api/v1/plato';
  List<Plato> _platosHome = new List();
  Plato _plato;
  int _actPage = 1;

  // Para utilizar un scrool infinito en el home  
  final _platoStream = StreamController<List<Plato>>.broadcast();

  Function(List<Plato> platos) get platosStreamSink => _platoStream.sink.add;

  Stream<List<Plato>> get allPlatosStream => _platoStream.stream;

  void disposeStreams() {
    _platoStream?.close();
  }

  set platosHome (List<Plato> platos) {
    _platosHome = platos;
    notifyListeners();
  }

  List<Plato> get platosHome => this._platosHome;

  get plato => this._plato;

  set plato (Plato plato) {
    _plato = plato;
  }

  Future<List<Plato>> _mapearPlatos(String url) async {
    final res = await http.get(url, headers: TOKE_HEADER);
    final data = json.decode(res.body);
    final List<dynamic> list = data['data'];
    
    List<Plato> platos = new List();
    list.forEach((l) {
      final p = Plato.fromJSONMap(l);
      platos.add(p);
    });
    return platos;
  }

  Future<Plato> getPlato(int idPlato) async {
    String url = '$_url/$idPlato';
    final res = await http.get(url, headers: TOKE_HEADER);
    final Map<String, dynamic> data = json.decode(res.body);
    Plato plato = Plato.fromJSONMap(data['data']);
    this.plato = plato; 
    return plato;
  } 

  Future<List<Plato>> getPlatos({int page:1}) async {
    if (_platosHome.length > 0) return _platosHome;

    String url = '$_url?page=$page';
    
    Future<List<Plato>> platos = _mapearPlatos(url);
    platosHome = await platos;
    return platosHome;
  }

  Future<List<Plato>> getForInfinityScroll({int page:1}) async {
    String url = '$_url?page=$_actPage';
    print(url);
    Future<List<Plato>> platos = _mapearPlatos(url);
    List<Plato> allPlatos = await platos;
    
    platosHome.addAll(allPlatos);
    platosStreamSink(platosHome);
    _actPage++;
    return platosHome;
  }

  Future<List<Plato>> getByRestaurante({
    int page:1, 
    @required int idRestaurante
  }) async {
    String url = '$_url/restaurante/$idRestaurante?page=$page';
    return _mapearPlatos(url);
  }

}