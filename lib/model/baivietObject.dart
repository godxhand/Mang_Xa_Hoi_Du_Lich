import 'package:doan2/model/UserObject.dart';
import 'package:doan2/model/dacsanObject.dart';
import 'package:doan2/model/diadiemObject.dart';
import 'package:doan2/model/dichvuObject.dart';
import 'package:doan2/model/hinh_bai_vietObject.dart';
import 'package:doan2/model/khachsanObject.dart';
import 'package:doan2/model/quananObject.dart';

class BaivietObject {
  int id;
  String noidung;
  int like;
  int dislike;
  int view;
  int trangthai;
  // int iddiadiem;
  // int idnguoidung;
  UserObject  user;
  DiaDiemObject diadiem;
  // HinhBaiVietObject hinh;

  BaivietObject(
    this.id,
    this.noidung,
    this.like,
    this.dislike,
    this.view,
    this.trangthai,
    // this.iddiadiem,
    // this.idnguoidung,
        this.user,
      this.diadiem,
      // this.hinh
  );

  BaivietObject.fromJson(Map<String, dynamic> bv)
      : id = bv["id"],
        noidung = bv["noidung"],
        like = bv["like"],
        dislike = bv["dislike"],
        view = bv["view"],
        trangthai = bv["trangthai"],
        // iddiadiem = bv["id_diadiem"],
  // idnguoidung = bv["id_nguoidung"],
  //user = UserObject.fromJson(bv["User"])
        user = bv["id_nguoidung"].map<UserObject>((e) => UserObject.fromJson(e)).toList()[0],
        diadiem  =bv ["id_diadiem"].map<DiaDiemObject>((e)=>DiaDiemObject.fromJson(e)).toList()[0]
        // hinh  =bv ["HinhBaiviet"].map<HinhBaiVietObject>((e)=>HinhBaiVietObject.fromJson(e)).toList()[0]

  ;
}
