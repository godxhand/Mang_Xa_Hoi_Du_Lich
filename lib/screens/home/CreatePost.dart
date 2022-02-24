import 'dart:io';
import 'package:doan2/model/UserObject.dart';
import 'package:doan2/model/diadiemObject.dart';
import 'package:doan2/provider/URL.dart';
import 'package:doan2/provider/baiviet_provider.dart';
import 'package:doan2/provider/user_provider.dart';
import 'package:doan2/screens/home/DSDiadiem.dart';
import 'package:doan2/screens/home/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:doan2/theme/colors/light_colors.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:getwidget/components/carousel/gf_items_carousel.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:http/src/base_response.dart';
class CreatePost extends StatefulWidget {
  // final UserObject user;
  int id_diadiem;
  String tendiadiem;
  CreatePost({Key? key,required this.id_diadiem, required this.tendiadiem}) : super(key: key);
  createpost createState() => createpost(id_diadiem,tendiadiem);
}

class createpost extends State<CreatePost> {
  String tendiadiem;
  int id_diadiem;
  createpost(this.id_diadiem,this.tendiadiem);
  final TextEditingController txtNoiDung = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  var image;
  void filePicker() async {
    final XFile? SelectImage = await _picker.pickImage(source: ImageSource.gallery);
    // print(SelectImage!.path);
    setState(() {
      image = File(SelectImage!.path);
    });

  }
  UploadPost() async{
  final taobaiviet = await BaiVietProvider.createpost(
      txtNoiDung.text,
      id_diadiem.toString(),
      '1',
      image
  );
  if (taobaiviet == true) {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context)=>HomeTab()),
            (Route<dynamic> route) => false);
    // Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeTab()));
  }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: LightColors.kDarkYellow,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Viết bài',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  UploadPost();
                },
                child: Text(
                  'Đăng',
                  style: TextStyle(color: Colors.black),
                ))
          ],
        ),
      ),
           body:  Container(
                margin: EdgeInsets.all(10),
                child: ListView(
                  children:<Widget>[
                    Container(
                      child: FutureBuilder<UserObject>(
                        future:UserProvider.get(),
                        builder: (context, snapshot){
                          if(snapshot.hasData){
                            return ListTile(
                              leading: CircleAvatar(
                                child: Text('HN'),
                              ),
                              title: Text(snapshot.data!.name,
                              ),
                              subtitle: Text(tendiadiem),
                            );
                          }
                          return Center();
                        }
                      ),
                    ),
                    TextField(
                      controller: txtNoiDung,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Chia Sẽ Cảm nhân của bạn ',
                      ),
                    ),
                    image == null ? Text(""): Image.file(File(image!.path),
                      width: 150,
                      fit: BoxFit.cover,),
                  ],),
              ),
          //  }
          //   return Center();
          // }
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        children: [
          SpeedDialChild(
            child: Icon(Icons.add_photo_alternate),
            label: 'Photo/Video',
            onTap: (){
              filePicker();
            },
          ),
          SpeedDialChild(
            child: Icon(Icons.location_on),
            label: 'checkIn',
            onTap: () {},
          ),
          SpeedDialChild(
            child: Icon(Icons.location_city),
            label: 'Địa điểm',
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>DSDiaDiem() ));
            },
          ),
        ],
      ),
    );
  }
}
