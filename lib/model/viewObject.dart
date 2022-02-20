import 'package:doan2/model/UserObject.dart';
import 'package:doan2/model/baivietObject.dart';

class ViewObject {
  final int id;
  final UserObject id_nguoidung;
  final BaivietObject id_baiviet;
  final int luotview;

  ViewObject(this.id,this.id_nguoidung,this.id_baiviet,this.luotview);

  ViewObject.fromJson(Map<String,dynamic>ks)
      : id = ks["id"],
        id_nguoidung=ks["id_nguoidung"],
        id_baiviet= ks["id_baiviet"],
        luotview=ks["luotview"];
}