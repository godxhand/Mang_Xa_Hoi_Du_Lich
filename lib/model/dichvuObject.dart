import 'diadiemObject.dart';

class DichVuObject {
  final int id;
  final String tendichvu;
  final String mota;
  final String hinhanh;
  final int id_diadiem;
  final int trangthai;

  DichVuObject(
      this.id,
      this.tendichvu,
      this.mota,
      this.hinhanh,
      this.id_diadiem,
      this.trangthai);


  DichVuObject.fromJson(Map<String,dynamic>dv)
      : id = dv["id"],
        tendichvu=dv["tendichvu"],
        mota=dv["mota"],
        hinhanh= dv["hinhanh"],
        id_diadiem= dv["id_diadiem"],
        trangthai=dv["trangthai"];

}
