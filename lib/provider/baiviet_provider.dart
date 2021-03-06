import 'dart:convert';
import 'dart:io';
import 'package:doan2/model/baivietObject.dart';
import 'package:http/http.dart' as http;
import 'URL.dart';


class BaiVietProvider {
  static List<BaivietObject> parse(String reponseBody) {
    final pased = jsonDecode(reponseBody).cast<Map<String, dynamic>>();
    return pased.map<BaivietObject>((e) => BaivietObject.fromJson(e)).toList();
  }
  static Future<List<BaivietObject>> getall() async{
    final response = await http.get(Uri.parse(URLAPI+'baiviet'));
    return parse(response.body);
  }

  static Future<bool> createpost(
       String noidung,String idDiaDiem, String idUser,File _image) async {
    //var token = await UserProvider.getToken();
    var stream = http.ByteStream(_image.openRead());
    stream.cast();
    var length = await _image.length();
  //  Map<String, String> headers = {"Authorization": "Bearer $token"};

    var uri = Uri.parse(URLAPI + "baiviet/create");
    var request = http.MultipartRequest("POST", uri);
    // request.headers.addAll(headers);
    request.fields["id_nguoidung"] = idUser;
    request.fields["noidung"] = noidung;
    request.fields["id_diadiem"]= idDiaDiem;

    var multiport =
    http.MultipartFile("hinhanh", stream, length, filename: _image.path);

    request.files.add(multiport);
    var response = await request.send();

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}