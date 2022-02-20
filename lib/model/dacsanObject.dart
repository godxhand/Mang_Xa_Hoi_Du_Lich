import 'package:doan2/model/quananObject.dart';

class DacSanObject {
  final int id;
  final String tendacsan;
  final String mota;
  final int gia;
  final String hinhanh;
  final int quanan_id;
  final int trangthai;

  DacSanObject(this.id,this.tendacsan,this.mota,this.gia,this.hinhanh,this.quanan_id,this.trangthai);

  DacSanObject.fromJson(Map<String,dynamic>ds)
      : id = ds["id"],
        tendacsan=ds["tendacsan"],
        mota= ds["mota"],
        gia=ds["gia"],
        hinhanh=ds["hinhanh"],
        quanan_id=ds["quanan_id"],
        trangthai=ds["trangthai"];
}