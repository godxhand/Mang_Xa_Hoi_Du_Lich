import 'package:doan2/model/dichvuObject.dart';
import 'package:doan2/model/khachsanObject.dart';
import 'package:doan2/model/quananObject.dart';
import 'package:doan2/model/thanhphoObject.dart';

class DiaDiemObject {
  final int id;
  final String tendiadiem;
  final String kinhdo;
  final String vido;
  final String mota;
  final String hinhanh;
  final int trangthai;

  DiaDiemObject(
      this.id,
      this.tendiadiem,
      this.hinhanh,
      this.kinhdo,
      this.vido,
      this.mota,
      this.trangthai);

  DiaDiemObject.fromJson(Map<String, dynamic> dd)
      : id = dd["id"],
        tendiadiem = dd["tendiadiem"],
        hinhanh = dd["hinhanh"],
        kinhdo = dd["kinhdo"],
        vido = dd["vido"],
        mota = dd["mieuta"],
        trangthai = dd["trangthai"];

  // DiaDiemObject.fromJson2(Map<String, dynamic> dd)
  //     : id=null,
  //       tendiadiem =null,
  //       kinhdo = null,
  //       vido = null,
  //       mota = null,
  //       trangthai = null,
  //       dichvu = dd["dichvu"]
  //           .map<DichVuObject>((e) => DichVuObject.fromJson(e))
  //           .toList(),
  //       khachsan = dd["khachsan"]
  //           .map<KhachSanObject>((e) => KhachSanObject.fromJson(e))
  //           .toList(),
  //       quanan = dd["quanan"]
  //           .map<QuanAnObject>((e) => QuanAnObject.fromJson(e))
  //           .toList(),
  //       thanhpho = dd["thanhpho"]
  //           .map<ThanhPhoObject>((e) => ThanhPhoObject.fromJson(e))
  //           .toList();
}
