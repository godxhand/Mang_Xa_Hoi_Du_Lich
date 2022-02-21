import 'package:doan2/model/dichvuObject.dart';
import 'package:doan2/model/quananObject.dart';
import 'package:doan2/provider/URL.dart';
import 'package:doan2/provider/dichvu_provider.dart';
import 'package:doan2/provider/quanan_provider.dart';
import 'package:doan2/screens/place/Detailplace.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/image/gf_image_overlay.dart';
import 'package:readmore/readmore.dart';

class DetailDichVu extends StatefulWidget {
  int id;
  DetailDichVu( this.id, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return DetailDichVuState(id);
  }
}

class DetailDichVuState extends State<DetailDichVu> {
  int id;
  DetailDichVuState(this.id);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:FutureBuilder<DichVuObject>(
          future: DichVuProvider.getid(id),
          builder: (context,snapshot) {
            if (snapshot.hasError) {
              return Text('Error;\n ${snapshot.error}');
            } else if (snapshot.hasData) {
              return SingleChildScrollView(
                  child: Column(children: <Widget>[
                    GFImageOverlay(
                      height: 250,
                      width: 400,
                      image: NetworkImage(URldichvu + snapshot.data!.hinhanh),
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
                              MaterialPageRoute(builder: (context) => DetailPlace(snapshot.data!.id_diadiem)));
                        },),
                      Text(snapshot.data!.tendichvu,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),),

                      ReadMoreText(
                        snapshot.data!.mota,
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
