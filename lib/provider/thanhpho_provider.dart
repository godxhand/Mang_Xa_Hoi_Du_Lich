import 'dart:convert';
import 'package:doan2/model/chitietdiadiemObject.dart';
import 'package:http/http.dart' as http;
import 'package:doan2/model/thanhphoObject.dart';
import 'URL.dart';

class KhuDuLichProvider {
  static List<KhudulichObject> parseThanhPho(String reponseBody) {
    final pased = jsonDecode(reponseBody).cast<Map<String, dynamic>>();
    return pased.map<KhudulichObject>((e) => KhudulichObject.fromJson(e)).toList();
  }

  static Future<KhudulichObject> getId(int id) async {
    final response = await http.get(Uri.parse(URLAPI + 'thanhpho/show/$id'));
    return KhudulichObject.fromJson2(jsonDecode(response.body));
  }
}
