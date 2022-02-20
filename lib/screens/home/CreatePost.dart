import 'dart:io';
import 'package:doan2/model/UserObject.dart';
import 'package:doan2/provider/baiviet_provider.dart';
import 'package:flutter/material.dart';
import 'package:doan2/theme/colors/light_colors.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:getwidget/components/carousel/gf_items_carousel.dart';
import 'package:image_picker/image_picker.dart';
class CreatePost extends StatefulWidget {
  final UserObject user;
  const CreatePost({Key? key, required this.user}) : super(key: key);
  @override
  createpost createState() => createpost( user: user);
}

class createpost extends State<CreatePost> {
  final UserObject user;

  createpost({ required this.user});

  final TextEditingController txtNoiDung = TextEditingController();
  final picker = ImagePicker();
  var _image;
  int idUser = 0;
  bool isPost = false;

  Future pickerImage() async {
    var pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {});
      _image = File(pickedFile.path);
      isPost = true;
    } else {
      const snackBar = SnackBar(content: Text('Chưa chọn ảnh'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  _createPost() async {
    bool isSuccess = await BaiVietProvider.createpost(
        _image,  user.id.toString(), txtNoiDung.text);
  }

  @override
  void initState() {
    super.initState();
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
                onPressed: _createPost(),
                child: Text(
                  'Đăng',
                  style: TextStyle(color: Colors.black),
                ))
          ],
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              children: const [
                CircleAvatar(
                  child: Text("HN"),),
                SizedBox(width: 8),
                Text("Khanh Sang"),

              ],),
            TextField(
              controller: txtNoiDung,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Chia Sẽ Cảm nhân của bạn ',
              ),
            ),
            // GFItemsCarousel(rowCount: 2,chilđren: ,),
          ],),
      ),

      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        children: [
          SpeedDialChild(
            child: Icon(Icons.add_photo_alternate),
            label: 'Photo/Video',
            onTap:  pickerImage,
          ),
          SpeedDialChild(
            child: Icon(Icons.location_on),
            label: 'checkIn',
            onTap:(){},
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
