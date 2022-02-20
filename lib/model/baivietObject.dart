import 'package:doan2/model/UserObject.dart';
import 'package:doan2/model/dacsanObject.dart';
import 'package:doan2/model/diadiemObject.dart';
import 'package:doan2/model/dichvuObject.dart';
import 'package:doan2/model/khachsanObject.dart';
import 'package:doan2/model/quananObject.dart';

class BaivietObject {
  int id;
  String noidung;
  int like;
  int dislike;
  int view;
  int trangthai;
  int iddiadiem;
  // int idnguoidung;
 UserObject  user;

  BaivietObject(
      this.id,
      this.noidung,
      this.like,
      this.dislike,
      this.view,
      this.trangthai,
      this.iddiadiem,
      // this.idnguoidung,
      this.user
      );

  BaivietObject.fromJson(Map<String, dynamic> bv)

      : id = bv["id"],
        noidung = bv["noi_dung"],
        like = bv["like"],
        dislike = bv["dislike"],
        view = bv["view"],
        trangthai = bv["trangthai"],
        iddiadiem = bv["id_diadiem"],
        // idnguoidung = bv["id_nguoidung"],
        //user = UserObject.fromJson(bv["User"])
        user = bv["User"].map<UserObject>((e) => UserObject.fromJson(e)).toList()[0]
  ;
}
