import 'dart:convert';
import 'package:doan2/model/chitietdiadiemObject.dart';
import 'package:http/http.dart' as http;
import 'URL.dart';

class CTDiaDiemProvider {
  static Future<CTDiadiemObject> getDiaDiemId(int id) async {
    final response = await http.get(Uri.parse(URLAPI + 'diadiem/show/$id'));

    return CTDiadiemObject.fromJson(jsonDecode(response.body));
  }
}
