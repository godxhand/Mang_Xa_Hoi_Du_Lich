import 'package:doan2/model/diadiemObject.dart';
import 'package:doan2/model/quananObject.dart';
import 'package:doan2/model/vungmienObject.dart';

import 'dichvuObject.dart';
import 'khachsanObject.dart';

class KhudulichObject {
  final int id;
  final String tenkhudulich;
  final String Kinhdo;
  final String Vido;
  final List<QuanAnObject>? quanan;
  final List<KhachSanObject>? khachsan;
  final List<DichVuObject>? dichvu;
  final int id_diadiem;
  final String hinhanh;
  final String mota;
  final int trangthai;

  KhudulichObject(
      this.id,
      this.tenkhudulich,
      this.Kinhdo,
      this.Vido,
      this.quanan,
      this.khachsan,
      this.dichvu,
      this.id_diadiem,
      this.hinhanh,
      this.mota,
      this.trangthai);
  // this.updatedAt);

  KhudulichObject.fromJson(Map<String, dynamic> dl)
      : id = dl["id"],
        tenkhudulich = dl["tendiadiem"],
        Kinhdo = dl["kinhdo"],
        Vido = dl["vido"],
        quanan = null,
        khachsan = null,
        dichvu = null,
        id_diadiem = dl["id_diadiem"],
        hinhanh = dl["hinhanh"],
        mota = dl["mota"],
        trangthai = dl["trangthai"];

  KhudulichObject.fromJson2(Map<String, dynamic> dl)
      : id = dl["id"],
        tenkhudulich = dl["tendiadiem"],
        Kinhdo = dl["kinhdo"],
        Vido = dl["vido"],
        quanan = dl["quanan"].map<QuanAnObject>((e) => QuanAnObject.fromJson(e)).toList(),
        khachsan = dl["khachsan"].map<KhachSanObject>((e) => KhachSanObject.fromJson(e)).toList(),
        dichvu = dl["dichvu"].map<DichVuObject>((e) => DichVuObject.fromJson(e)).toList(),
        id_diadiem = dl["id_diadiem"],
        hinhanh = dl["hinhanh"],
        mota = dl["mota"],
        trangthai = dl["trangthai"];
}
