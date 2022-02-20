import 'package:doan2/model/dichvuObject.dart';
import 'package:doan2/model/khachsanObject.dart';
import 'package:doan2/model/quananObject.dart';
import 'package:doan2/provider/URL.dart';
import 'package:doan2/model/thanhphoObject.dart';
import 'package:doan2/provider/thanhpho_provider.dart';
import 'package:doan2/screens/place/chitietdiadiem/DichVu.dart';
import 'package:doan2/screens/place/chitietdiadiem/khachsan.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:readmore/readmore.dart';

import 'Detailplace.dart';
import 'chitietdiadiem/quanan.dart';

class CTKhuDuLich extends StatefulWidget {
  int id;
  CTKhuDuLich(this.id, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return CTKhuDuLichState(id);
  }
}

class CTKhuDuLichState extends State<CTKhuDuLich> {
  int id;
  CTKhuDuLichState(this.id);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<KhudulichObject>(
            future: KhuDuLichProvider.getId(id),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text('Error:\n ${snapshot.error}'),
                );
              } else if (snapshot.hasData) {
                List<QuanAnObject> qa = snapshot.data!.quanan.toList();
                List<KhachSanObject> ks = snapshot.data!.khachsan.toList();
                List<DichVuObject> dv = snapshot.data!.dichvu.toList();
                return SingleChildScrollView(
                    child: Column(children: <Widget>[
                      GFImageOverlay(
                        height: 250,
                        width: 400,
                        image: NetworkImage(URLthanhpho+snapshot.data!.hinhanh),
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
                        //                       Text(snapshot.data!.mota),
                        ReadMoreText(
                          snapshot.data!.mota,
                          style: TextStyle(color: Colors.black),
                          trimCollapsedText: 'xem them',
                          trimExpandedText: 'thu gon',
                        ),
                        Text('Dich Vu: ',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                          ),),
                        Container(
                          height: 300,
                          child:ListView.builder(
                            // itemCount: qa.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => Container(
                              child:  InkWell(
                                child: SingleChildScrollView(
                                  padding: EdgeInsets.all(10),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(3),
                                        child: GFImageOverlay(
                                          height: 250,
                                          width: 300,
                                          borderRadius: BorderRadius.all(Radius.circular(10)),
                                          image: NetworkImage(URldichvu+dv[index].hinhanh),
                                          colorFilter: new ColorFilter.mode(
                                              Colors.black.withOpacity(0.3), BlendMode.darken),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                onTap: () {
                                  Navigator.push(
                                      context, MaterialPageRoute(builder: (context) => DetailDichVu()));
                                },
                              ),
                            ),
                          ),
                        ),
                        Text('Khach San:',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                          ),),
                        Container(
                          height: 300,
                          child:ListView.builder(
                            // itemCount: qa.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => Container(
                              child:  InkWell(
                                child: SingleChildScrollView(
                                  padding: EdgeInsets.all(10),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(3),
                                        child: GFImageOverlay(
                                          height: 250,
                                          width: 300,
                                          borderRadius: BorderRadius.all(Radius.circular(10)),
                                          image: NetworkImage(URlkhachsan+ks[index].hinhanh),
                                          colorFilter: new ColorFilter.mode(
                                              Colors.black.withOpacity(0.3), BlendMode.darken),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                onTap: () {
                                  Navigator.push(
                                      context, MaterialPageRoute(builder: (context) => DetailKhachSan(ks[index].id)));
                                },
                              ),
                            ),
                          ),
                        ),
                        Text('Quan An: ',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                          ),),
                        Container(
                          height: 300,
                          child:ListView.builder(
                            // itemCount: qa.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => Container(
                              child:  InkWell(
                                child: SingleChildScrollView(
                                  padding: EdgeInsets.all(10),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(3),
                                        child: GFImageOverlay(
                                          height: 250,
                                          width: 300,
                                          borderRadius: BorderRadius.all(Radius.circular(10)),
                                          image: NetworkImage(URlquanan+qa[index].hinhanh),
                                          colorFilter: new ColorFilter.mode(
                                              Colors.black.withOpacity(0.3), BlendMode.darken),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                onTap: () {
                                  Navigator.push(
                                      context, MaterialPageRoute(builder: (context) => DetailQuanAn(qa[index].id)));
                                },
                              ),
                            ),
                          ),
                        ),
                      ])

                    ])
                );
              }
              return Center();
            })
    );
  }
}
