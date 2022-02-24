import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:doan2/model/khachsanObject.dart';

import 'URL.dart';

class KhachSanProvider {
  static List<KhachSanObject> parseQuanAn(String reponseBody) {
    final pased = jsonDecode(reponseBody)["data"].cast<Map<String, dynamic>>();
    return pased.map<KhachSanObject>((e) => KhachSanObject.fromJson(e)).toList();
  }
  static Future<KhachSanObject> getid(int id) async {
    final response = await http.get(Uri.parse(URLAPI+'khachsan/show/$id'));
    return KhachSanObject.fromJson(jsonDecode(response.body));
  }
}