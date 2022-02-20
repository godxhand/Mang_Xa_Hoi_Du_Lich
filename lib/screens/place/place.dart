import 'package:doan2/model/diadiemObject.dart';
import 'package:doan2/provider/diadiem_provider.dart';
import 'package:doan2/screens/map/Map.dart';
import 'package:doan2/screens/place/Detailplace.dart';
import 'package:doan2/theme/colors/light_colors.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

void main() => runApp(Place());

class Place extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyGridScreen(),
    );
  }
}

class MyGridScreen extends StatefulWidget {
  @override
  _MyGridScreenState createState() => _MyGridScreenState();
}

class _MyGridScreenState extends State<MyGridScreen> {
  List<DiaDiemObject> lsdiadiem = [];
  _loaddiadiem() async {
    final data = await DiaDiemProvider.getall();
    setState(() {
      lsdiadiem = data;
    });
  }

  @override
  void initState() {
    super.initState();
    _loaddiadiem();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: lsdiadiem.length,
        itemBuilder: (context, index) => Container(
          child: GFCard(
            title: GFListTile(
              avatar: GFAvatar(
                backgroundImage: AssetImage('assets/images/logo-3.png'),
                backgroundColor: Colors.white,
              ),
              title: Text(lsdiadiem[index].tendiadiem),
            ),
            // content: Text(),
            buttonBar: GFButtonBar(
              children: <Widget>[
                GFButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                DetailPlace(lsdiadiem[index].id)));
                  },
                  text: 'Xem Chi Tiết',
                  shape: GFButtonShape.pills,
                  color: LightColors.kDarkYellow,
                ),
                GFButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) =>
                           Map(double.parse(lsdiadiem[index].vido),
                               double.parse(lsdiadiem[index].kinhdo))
                        ));
                  },
                  text: 'Xem tren map',
                  shape: GFButtonShape.pills,
                  color: LightColors.kDarkYellow,
                ),
              ],
            ),
          ),
        ),
      ),
    );
// FutureBuilder<DiaDiemObject>(
//   future: DiaDiemProvider.getDiaDiemId(id),
//   builder: (context,snapshot) {
//     if(snapshot.hasError) {
//       return Center(
//         child: Text('Co Loi Xay ra!'),);
//     } else if(snapshot.hasData!){
//       DiaDiemObject a =snapshot.data!;
//      return Container(
  }
}

// class getId_dd extends StatelessWidget{
//   final int id_Thanhpho;
//   const getId_dd({Key?key, required this.id_Thanhpho}) : super (key: key);
//   @override
//   Widget build(BuildContext context){
//     return FutureBuilder<DiaDiemObject>(
//         future: DiaDiemProvider.getDiaDiemId(),
//         builder: (context,snapshot){
//           if(snapshot.hasData){
//             DiaDiemObject u = snapshot.data!;
//
//         });
//   }
// }