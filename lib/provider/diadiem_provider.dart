import 'dart:convert';
import 'package:doan2/model/diadiemObject.dart';
import 'package:http/http.dart' as http;
import 'URL.dart';

class DiaDiemProvider {
  static List<DiaDiemObject> parse(String reponseBody) {
    final pased = jsonDecode(reponseBody).cast<Map<String, dynamic>>();
    return pased.map<DiaDiemObject>((e) => DiaDiemObject.fromJson(e)).toList();
  }

  static Future<List<DiaDiemObject>> getall() async {
    final response = await http.get(Uri.parse(URLAPI + 'diadiem'));
    return parse(response.body);
  }
}
