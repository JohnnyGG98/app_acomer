import 'dart:convert';

import 'package:app_acomer/src/models/cliente/Cliente.dart';
import 'package:app_acomer/src/utils/c.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class ClienteProvider with ChangeNotifier {
  String _url = '${BASE_URL}api/v1/cliente';
  List<Cliente> _clientesHome;

  set clientesHome(List<Cliente> clientes) {
    _clientesHome = clientes;
    notifyListeners();
  }

  get clientesHome => this._clientesHome;

  Future<List<Cliente>> _mapearClientes(String url) async {
    final res = await http.get(url, headers: TOKE_HEADER);
    final data = json.decode(res.body);
    final List<dynamic> list = data['data'];

    List<Cliente> clientes = new List();
    list.forEach((l) {
      final c = Cliente.fromJSONMap(l);
      clientes.add(c);
    });

    print(clientes);
    clientesHome = clientes;
    return clientes;
  }

  Future<List<Cliente>> getClientes({int page}) async {
    if (_clientesHome == null) return _clientesHome;

    String url = '$_url?page=$page';
    return _mapearClientes(url);
  }


  Future<Cliente> getCliente({@required int idCliente}) async {
    String url = '$_url/$idCliente';
    final res = await http.get(url, headers: TOKE_HEADER);
    final data = json.decode(res.body);
    final Map<String, dynamic> decodeData = data['data'];
    print(decodeData);
    final Cliente c = Cliente.fromJSONMap(decodeData);
    return c;
  }



}
