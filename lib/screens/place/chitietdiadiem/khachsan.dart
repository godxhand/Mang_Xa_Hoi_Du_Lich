import 'package:doan2/model/khachsanObject.dart';
import 'package:doan2/provider/URL.dart';
import 'package:doan2/provider/khachsan_provider.dart';
import 'package:doan2/screens/place/Detailplace.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/image/gf_image_overlay.dart';
import 'package:readmore/readmore.dart';

class DetailKhachSan extends StatefulWidget {
  int id;
  DetailKhachSan( this.id, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return DetailKhachSanState(id);
  }
}

class DetailKhachSanState extends State<DetailKhachSan> {
  int id;
  DetailKhachSanState(this.id);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:FutureBuilder<KhachSanObject>(
          future: KhachSanProvider.getid(id),
          builder: (context,snapshot) {
            if (snapshot.hasError) {
              return Text('Error;\n ${snapshot.error}');
            } else if (snapshot.hasData) {
              KhachSanObject ks = snapshot.data!;
              return SingleChildScrollView(
                  child: Column(children: <Widget>[
                    GFImageOverlay(
                      height: 250,
                      width: 400,
                      image: NetworkImage(UrlServer + ks.hinhanh),
                      colorFilter: new ColorFilter.mode(
                          Colors.black.withOpacity(0.3), BlendMode.dst),
                    ),
                    Column(children: [
                      FlatButton(
                        child: Text("Quay Lai"),
                        shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        color: Colors.orangeAccent,
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => DetailPlace(ks.id_diadiem)));
                        },),
                      Text(ks.tenkhachsan,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),),
                      Text("Dia chi: "+ks.diachi,
                      style: TextStyle(
                        fontSize: 16,
                      ),),
                      ReadMoreText(
                        ks.mota,
                        style: TextStyle(color: Colors.black),
                        trimCollapsedText: 'xem them',
                        trimExpandedText: 'thu gon',
                      ),
                    ])
                  ]
                  )
              );
            };
            return Center();
          }
        ),
    );
  }
}
