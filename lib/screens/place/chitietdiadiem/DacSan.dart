import 'package:doan2/model/dacsanObject.dart';
import 'package:doan2/provider/URL.dart';
import 'package:doan2/provider/dacsan_provider.dart';
import 'package:doan2/screens/place/chitietdiadiem/quanan.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/image/gf_image_overlay.dart';
import 'package:readmore/readmore.dart';

class DetailDacSan extends StatefulWidget {
  int id;
  DetailDacSan( this.id, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return DetailDacSanState(id);
  }
}

class DetailDacSanState extends State<DetailDacSan> {
  int id;
  DetailDacSanState(this.id);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:FutureBuilder<DacSanObject>(
          future: DacSanProvider.getId(id),
          builder: (context,snapshot) {
            if (snapshot.hasError) {
              return Text('Error;\n ${snapshot.error}');
            } else if (snapshot.hasData) {
              return SingleChildScrollView(
                  child: Column(children: <Widget>[
                    GFImageOverlay(
                      height: 250,
                      width: 400,
                      image: NetworkImage(URldacsan + snapshot.data!.hinhanh),
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
                              MaterialPageRoute(builder: (context) => DetailQuanAn(snapshot.data!.quanan_id)));
                        },),
                      Text(snapshot.data!.tendacsan,
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
