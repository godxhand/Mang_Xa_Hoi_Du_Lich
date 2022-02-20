import 'dart:convert';
import 'package:doan2/model/quananObject.dart';
import 'package:http/http.dart' as http;

import 'URL.dart';
class QuanAnProvider {
  static List<QuanAnObject> parseQuanAn(String reponseBody) {
    final pased = jsonDecode(reponseBody).cast<Map<String,dynamic>>();
    return pased.map<QuanAnObject>((e) => QuanAnObject.fromJson(e)).toList();
  }
  static Future<QuanAnObject> getid(int id) async {
    final response = await http.get(Uri.parse(URLAPI+'quanan/$id'));
    return QuanAnObject.fromJson(jsonDecode(response.body));
  }
}