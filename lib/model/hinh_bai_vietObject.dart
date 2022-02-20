import 'package:doan2/model/baivietObject.dart';

class HinhBaiVietObject {
  final int id;
  final String nguon;
  final BaivietObject id_hinh_anh;
  final int trangthai;

  HinhBaiVietObject(this.id,this.nguon,this.id_hinh_anh,this.trangthai);

  HinhBaiVietObject.fromJson(Map<String,dynamic>hinhanh)
  : id = hinhanh["id"],
    nguon=hinhanh["nguon"],
    id_hinh_anh= hinhanh["id_hinh_anh"],
    trangthai=hinhanh["trangthai"];
}