import 'package:doan2/model/dichvuObject.dart';
import 'package:doan2/model/khachsanObject.dart';
import 'package:doan2/model/quananObject.dart';
import 'package:doan2/model/thanhphoObject.dart';

import 'diadiemObject.dart';

class CTDiadiemObject {
  // final List<DichVuObject>? dichvu;
  // final List<KhachSanObject> khachsan;
  // final List<QuanAnObject> quanan;
  final int id;
  final String tendiadiem;
  final String kinhdo;
  final String vido;
  final String mota;
  final String hinhanh;
  final int trangthai;
  final List<KhudulichObject> khudulich;

  CTDiadiemObject(
  this.id,
  this.tendiadiem,
  this.hinhanh,
  this.kinhdo,
  this.vido,
  this.mota,
  this.trangthai,
//      this.dichvu,
//       this.khachsan,
//       this.quanan
  this.khudulich
      );

  CTDiadiemObject.fromJson(Map<String, dynamic> dd)
      : id = dd["id"],
        tendiadiem = dd["tendiadiem"],
        hinhanh = dd["hinhanh"],
        kinhdo = dd["kinhdo"],
        vido = dd["vido"],
        mota = dd["mieuta"],
        trangthai = dd["trangthai"],
      khudulich= dd["diadiem"].map<KhudulichObject>((e) => KhudulichObject.fromJson(e)).toList();
  //       dichvu = dd["dichvu"].map<DichVuObject>((e) =>
  // DichVuObject.fromJson(e)).toList(),
  //       khachsan = dd["khachsan"].map<KhachSanObject>((e) =>
  // KhachSanObject.fromJson(e)).toList(),
  //       quanan = dd["quanan"].map<QuanAnObject>((e) =>
  // QuanAnObject.fromJson(e)).toList();
}
