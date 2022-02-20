import 'package:doan2/screens/place/chitietdiadiem/DichVu.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class DSDichVu extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DSDichVuState();
  }
}

class DSDichVuState extends State<DSDichVu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(10),
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.all(3),
                child: GFImageOverlay(
                  height: 250,
                  width: 300,
                  child: Padding(
                      padding: EdgeInsets.all(30),
                      child: Row(
                        children: [
                          Text(
                            'Đánh giá',
                            style: TextStyle(color: Colors.white),
                          ),
                          Padding(
                              padding: EdgeInsets.all(5),
                              child: Text(
                                '8',
                                style: TextStyle(color: Colors.white),
                              ))
                        ],
                      )),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  image: AssetImage('assets/images/VN.jpg'),
                  colorFilter: new ColorFilter.mode(
                      Colors.black.withOpacity(0.3), BlendMode.darken),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(3),
                child: GFImageOverlay(
                  height: 250,
                  width: 300,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  image: AssetImage('assets/images/VN.jpg'),
                  colorFilter: new ColorFilter.mode(
                      Colors.black.withOpacity(0.3), BlendMode.darken),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(3),
                child: GFImageOverlay(
                  height: 250,
                  width: 300,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  image: AssetImage('assets/images/VN.jpg'),
                  colorFilter: new ColorFilter.mode(
                      Colors.black.withOpacity(0.3), BlendMode.darken),
                ),
              ),
            ],
          ),
        ),

      ),
    );
  }
}
