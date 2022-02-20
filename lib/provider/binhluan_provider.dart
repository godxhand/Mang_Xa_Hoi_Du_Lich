import 'dart:convert';

import 'package:doan2/model/BinhluanObject.dart';

class BinhLuanProvider {
  static List<BinhluanObject> parseQuanAn(String reponseBody) {
    final pased = jsonDecode(reponseBody).cast<Map<String, dynamic>>();
    return pased.map<BinhluanObject>((e) => BinhluanObject.fromJson(e)).toList();
  }

}