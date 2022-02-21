import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:doan2/model/dacsanObject.dart';

import 'URL.dart';

class DacSanProvider {
  static List<DacSanObject> parseUsers(String reponseBody) {
    final pased = jsonDecode(reponseBody).cast<Map<String, dynamic>>();
    return pased.map<DacSanObject>((e) => DacSanObject.fromJson(e)).toList();
  }

  static Future<DacSanObject> getId(int id) async {
    final response = await http.get(Uri.parse(URLAPI + 'dacsan/show/$id'));
    return DacSanObject.fromJson(jsonDecode(response.body));
  }
}