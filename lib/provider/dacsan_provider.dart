import 'dart:convert';
import 'package:doan2/model/UserObject.dart';
import 'package:doan2/model/dacsanObject.dart';

class DacSanProvider {
  static List<DacSanObject> parseUsers(String reponseBody) {
    final pased = jsonDecode(reponseBody).cast<Map<String, dynamic>>();
    return pased.map<DacSanObject>((e) => DacSanObject.fromJson(e)).toList();
  }
}