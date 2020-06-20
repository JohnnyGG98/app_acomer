import 'dart:convert';

import 'package:app_acomer/src/models/menudia/MenuDia.dart';
import 'package:app_acomer/src/utils/c.dart';
import 'package:http/http.dart' as http;

export 'package:app_acomer/src/models/menudia/MenuDia.dart';

class MenuDiaProvider {

  String _url = '${BASE_URL}api/v1/menudia';

  Future<MenuDia> getOneByRestaurante(int idRestaurante) async {
    String url = '$_url/restaurante/first/$idRestaurante';

    final res = await http.get(url, headers: TOKE_HEADER);
    final data = json.decode(res.body);
    if (data['status'] == 200) {
      final Map<String, dynamic> body = data['data'];
      return MenuDia.fromJSONMap(body);
    }
    return null;
  }

  Future<List<MenuDia>> getByRestaurante(int idRestaurante) async {
    String url = '$_url/restaurante/$idRestaurante';
    print(url);
    final res = await http.get(url, headers: TOKE_HEADER);
    final data = json.decode(res.body);
    final List<dynamic> list = data['data'];

    List<MenuDia> menus = new List();
    list.forEach((item) {
      final m = MenuDia.fromJSONMap(item);
      menus.add(m);
    });
    return menus;
  }

}