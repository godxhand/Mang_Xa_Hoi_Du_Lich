import 'dart:io';
import 'package:doan2/model/UserObject.dart';
import 'package:doan2/provider/URL.dart';
import 'package:doan2/provider/baiviet_provider.dart';
import 'package:flutter/material.dart';
import 'package:doan2/theme/colors/light_colors.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:getwidget/components/carousel/gf_items_carousel.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:http/src/base_response.dart';
class CreatePost extends StatefulWidget {
  // final UserObject user;
  // const CreatePost({Key? key, required this.user}) : super(key: key);
  @override
  createpost createState() => createpost();
}

class createpost extends State<CreatePost> {
  final TextEditingController txtNoiDung = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  XFile? image;

  void filePicker() async {
    final XFile? SelectImage = await _picker.pickImage(source: ImageSource.gallery);
   // print(SelectImage!.path);
    setState(() {
      image = SelectImage;
    });
  }
  // @override
  // void initState() {
  //   super.initState();
  //   filePicker();
  // }
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
                onPressed: () {},
                child: Text(
                  'Đăng',
                  style: TextStyle(color: Colors.black),
                ))
          ],
        ),
      ),
      body: Container(
        width: 800,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              children: const [
                CircleAvatar(
                  child: Text("HN"),
                ),
                SizedBox(width: 8),
                Text("Khanh Sang"),
              ],
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
            image == null ? Text("No Image"): Image.file(File(image!.path),
              width: 150,
              fit: BoxFit.cover,
            )
          ],
        ),
      ),
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
          ),
        ],
      ),
    );
  }
}
