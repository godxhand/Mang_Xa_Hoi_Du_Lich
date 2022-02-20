import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:doan2/model/dichvuObject.dart';

import 'URL.dart';

class DichVuProvider {
  static List<DichVuObject> parseQuanAn(String reponseBody) {
    final pased = jsonDecode(reponseBody)["data"].cast<Map<String, dynamic>>();
    return pased.map<DichVuObject>((e) => DichVuObject.fromJson(e)).toList();
  }
  static Future<List<DichVuObject>> getall() async {
    final response = await http.get(Uri.parse(URLAPI+'dichvu'));
    return parseQuanAn(response.body);
  }
}