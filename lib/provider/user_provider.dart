import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:doan2/model/UserObject.dart';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';

import 'URL.dart';

class UserProvider {
  static List<UserObject> parseUsers(String reponseBody) {
    final pased = jsonDecode(reponseBody).cast<Map<String, dynamic>>();
    return pased.map<UserObject>((e) => UserObject.fromJson(e)).toList();
  }
  static Future <UserObject> get() async{
    final response = await http.get(Uri.parse(URLAPI + 'user/1'));
    return UserObject.fromJson(jsonDecode(response.body));
  }

//ok
  static Future<bool> login(String email, String password) async {

    final response = await http.post(Uri.parse(URLAPI + 'auth/login'),
        body: ({
          'email': email,
          'password': password,
        }),headers: {
          'Content-type': 'application/x-www-form-urlencoded',
          'X-Requested-With': 'XMLHttpRequest',
          'Client-secret': 'qfYjiotdmTRKfLyi1kcMsVZw9V5bzV2vuFkeMqZ3',
          'Accept':'application/json',
        });
    final jsonRespon = jsonDecode(response.body);
    if (jsonRespon["status_code"] == 200) {
      /* ==== Lưu trữ token vào Storage ==== */
      SharedPreferences pres = await SharedPreferences.getInstance();
      pres.setString('access_token', jsonRespon["access_token"]);
      /* ==== In ra token ==== */
      return true;
    } else {
      return false;
    }
  }

  static Future<dynamic> getToken() async {
    /* ==== Lấy token từ Storage ==== */
    SharedPreferences pres = await SharedPreferences.getInstance();
    var token = pres.getString('access_token');
    return token;
  }

  static Future<UserObject> getUser() async {
    var token = await getToken();
    final response = await http.get(Uri.parse(URLAPI + 'auth/user'), headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    SharedPreferences pres = await SharedPreferences.getInstance();
    String user = response.body;
    pres.setString('user', user);
    return UserObject.fromJson(jsonDecode(response.body));
  }

  static Future<bool> register(String name, String email, String password,
      String password_confirmation) async {
    final response = await http.post(Uri.parse(URLAPI + 'auth/signup'),
        body: jsonEncode({
          'name': name,
          'email': email,
          'password': password,
          'password_confirmation': password_confirmation
        }),
        headers: {
          'Content-type': 'application/x-www-form-urlencoded',
          'X-Request-With':'XMLHttpRequets',
          'Client-secret': 'qfYjiotdmTRKfLyi1kcMsVZw9V5bzV2vuFkeMqZ3',

        });
    final jsonRespon = jsonDecode(response.body);

    if (jsonRespon["status_code"] == 200) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> isLogged() async {
    var token = await getToken();
    final response = await http.get(Uri.parse(URLAPI + 'user'), headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    final code = response.statusCode;
    if (code == 200) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> logout() async {
    var token = await getToken();
    final response = await http.post(Uri.parse(URLAPI + 'logout'), headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    final jsonRespon = jsonDecode(response.body);
    if (jsonRespon['status_code'] == 200) {
      return true;
    } else {
      return false;
    }
  }

  /* ==== Upload Avatar ==== */
  static Future<bool> uploadImage(File _image) async {
    var token = await UserProvider.getToken();
    var stream = http.ByteStream(_image.openRead());
    stream.cast();
    var length = await _image.length();

    Map<String, String> headers = {"Authorization": "Bearer $token"};

    var uri = Uri.parse(URLAPI + "user/avatar");
    var request = http.MultipartRequest("POST", uri);
    request.headers.addAll(headers);
    var multiport =
        http.MultipartFile("hinhAnh", stream, length, filename: _image.path);

    request.files.add(multiport);
    var response = await request.send();

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
