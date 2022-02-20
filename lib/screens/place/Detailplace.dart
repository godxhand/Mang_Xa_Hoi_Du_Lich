import 'package:doan2/model/chitietdiadiemObject.dart';
import 'package:doan2/model/diadiemObject.dart';
import 'package:doan2/provider/URL.dart';
import 'package:doan2/provider/chitietdiadiem_provider.dart';
import 'package:doan2/model/thanhphoObject.dart';
import 'package:doan2/screens/place/place.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:readmore/readmore.dart';

class DetailPlace extends StatefulWidget {
  int id;
  DetailPlace(this.id, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return DetailPlaceState(id);
  }
}

class DetailPlaceState extends State<DetailPlace> {
  int id;
  DetailPlaceState(this.id);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<CTDiadiemObject>(
            future: CTDiaDiemProvider.getDiaDiemId(id),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text('Error:\n ${snapshot.error}'),
                );
              } else if (snapshot.hasData) {
                List<KhudulichObject> tp = snapshot.data!.khudulich;
                return SingleChildScrollView(
                    child: Column(children: <Widget>[
                      GFImageOverlay(
                        height: 250,
                        width: 400,
                        image: NetworkImage(URldiadiem+snapshot.data!.hinhanh),
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
                                MaterialPageRoute(builder: (context) => Place()));
                            },),
 //                       Text(snapshot.data!.mota),
                        ReadMoreText(
                          snapshot.data!.mota,
                          style: TextStyle(color: Colors.black),
                          trimCollapsedText: 'xem them',
                          trimExpandedText: 'thu gon',
                        ),
                        Text('Khu Du Lich',
                        style: TextStyle(
                          fontWeight:FontWeight.w700,
                          fontSize: 20,
                        ),),
                        Container(
                          height: 300,
                          child: ListView.builder(
                            itemCount:tp.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index)=>Container(
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
                                          image: NetworkImage(URLthanhpho+tp[index].hinhanh),
                                          colorFilter: new ColorFilter.mode(
                                              Colors.black.withOpacity(0.3), BlendMode.darken),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                onTap: () {
                                  // Navigator.push(
                                  //     context, MaterialPageRoute(builder: (context) => DetailQuanAn(qa[index].id)));
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
// Text('Dich Vu: ',
//   style: TextStyle(
//     fontWeight: FontWeight.w700,
//     fontSize: 20,
//   ),),
// Container(
//   height: 300,
//   child: DSDichVu(),
// ),
// Text('Khach San:',
//   style: TextStyle(
// fontWeight: FontWeight.w700,
// fontSize: 20,
//   ),),
// Container(
//   height: 300,
//   child: DSKhachSan(snapshot.data!.id),
// ),
// Text('Quan An: ',
//   style: TextStyle(
// fontWeight: FontWeight.w700,
// fontSize: 20,
//   ),),
// Container(
//   height: 300,
//   child: DSQuanAn(snapshot.data!.id),
// ),