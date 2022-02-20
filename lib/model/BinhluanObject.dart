import 'package:doan2/model/UserObject.dart';
import 'package:doan2/model/baivietObject.dart';

class BinhluanObject {
  final int id;
  final int id_nguoidung;
  final int id_baiviet;
  final String noidung;

  BinhluanObject(this.id,this.id_nguoidung,this.id_baiviet,this.noidung);

  BinhluanObject.fromJson(Map<String,dynamic>bl)
      : id = bl["id"],
        id_nguoidung=bl["id_nguoidung"],
        id_baiviet= bl["id_baiviet"],
        noidung=bl["noidung"];
}