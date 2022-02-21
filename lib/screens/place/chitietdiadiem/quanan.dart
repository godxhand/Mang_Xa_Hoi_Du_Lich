import 'package:doan2/model/quananObject.dart';
import 'package:doan2/provider/URL.dart';
import 'package:doan2/provider/quanan_provider.dart';
import 'package:doan2/screens/place/CTKhuDuLich.dart';
import 'package:doan2/screens/place/Detailplace.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/image/gf_image_overlay.dart';
import 'package:readmore/readmore.dart';

class DetailQuanAn extends StatefulWidget {
  int id;
  DetailQuanAn( this.id, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return DetailQuanAnState(id);
  }
}

class DetailQuanAnState extends State<DetailQuanAn> {
  int id;
  DetailQuanAnState(this.id);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:FutureBuilder<QuanAnObject>(
          future: QuanAnProvider.getid(id),
          builder: (context,snapshot) {
            if (snapshot.hasError) {
              return Text('Error;\n ${snapshot.error}');
            } else if (snapshot.hasData) {
              QuanAnObject qa = snapshot.data!;
              return SingleChildScrollView(
                  child: Column(children: <Widget>[
                    GFImageOverlay(
                      height: 250,
                      width: 400,
                      image: NetworkImage(URlquanan + qa.hinhanh),
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
                              MaterialPageRoute(builder: (context) => CTKhuDuLich(qa.id_diadiem)));
                        },),
                      Text(qa.tenquanan,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),),
                      Text("Dia chi: "+qa.diachi,
                        style: TextStyle(
                          fontSize: 16,
                        ),),
                      ReadMoreText(
                        qa.mota,
                        style: TextStyle(color: Colors.black),
                        trimCollapsedText: 'xem them',
                        trimExpandedText: 'thu gon',
                      ),
                      // Container(
                      //   height: 300,
                      //   child: ListView.builder(
                      //     itemCount: qa.length,
                      //     scrollDirection: Axis.horizontal,
                      //     itemBuilder: (context, index) => Container(
                      //       child: InkWell(
                      //         child: SingleChildScrollView(
                      //           padding: EdgeInsets.all(10),
                      //           child: Row(
                      //             children: [
                      //               Padding(
                      //                 padding: EdgeInsets.all(3),
                      //                 child: GFImageOverlay(
                      //                   height: 250,
                      //                   width: 300,
                      //                   borderRadius:
                      //                   BorderRadius.all(Radius.circular(10)),
                      //                   image: NetworkImage(
                      //                       URlkhachsan + ks[index].hinhanh),
                      //                   colorFilter: new ColorFilter.mode(
                      //                       Colors.black.withOpacity(0.3),
                      //                       BlendMode.darken),
                      //                 ),
                      //               ),
                      //             ],
                      //           ),
                      //         ),
                      //         onTap: () {
                      //           Navigator.push(
                      //               context,
                      //               MaterialPageRoute(
                      //                   builder: (context) =>
                      //                       DetailKhachSan(ks[index].id)));
                      //         },
                      //       ),
                      //     ),
                      //   ),
                      // ),
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
