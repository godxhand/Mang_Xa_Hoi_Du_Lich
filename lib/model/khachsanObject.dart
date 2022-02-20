import 'package:doan2/model/diadiemObject.dart';

class KhachSanObject {
  final int id;
  final String tenkhachsan;
  final String hinhanh;
  final String mota;
  final String Kinhdo;
  final String Vido;
  final String diachi;
  final int danhgia;
  final int id_diadiem;
  final int trangthai;

  KhachSanObject(
      this.id,
      this.tenkhachsan,
      this.hinhanh,
      this.mota,
      this.Kinhdo,
      this.Vido,
      this.diachi,
      this.danhgia,
      this.id_diadiem,
      this.trangthai,
      );

  KhachSanObject.fromJson(Map<String,dynamic>ks)
      : id = ks["id"],
        tenkhachsan=ks["tenkhachsan"],
        hinhanh= ks["hinhanh"],
        Kinhdo = ks["kinhdo"],
        Vido =ks["vido"],
        mota = ks["mota"],
      diachi=ks["diachi"],
        danhgia=ks["danhgia"],
        id_diadiem= ks["id_diadiem"],
        trangthai=ks["trangthai"]
  ;
}