 import 'package:doan2/model/diadiemObject.dart';

class QuanAnObject {
  final int id_diadiem;
  final int id;
  final String tenquanan;
  final String mota;
  final String Kinhdo;
  final String Vido;
  final String diachi;
  final String hinhanh;

  QuanAnObject(
      this.id,
      this.tenquanan,
      this.id_diadiem,
      this.mota,
      this.Kinhdo,
      this.Vido,
      this.diachi,
      this.hinhanh);


  QuanAnObject.fromJson(Map<String,dynamic>qa)
       : id = qa["id"],
         tenquanan=qa["tenquanan"],
         id_diadiem= qa["id_diadiem"],
         Kinhdo = qa["kinhdo"],
         Vido =qa["vido"],
         mota = qa["mota"],
         diachi= qa["diachi"],
         hinhanh=qa["hinhanh"]
  ;

}