import 'package:doan2/model/diadiemObject.dart';
import 'package:doan2/provider/diadiem_provider.dart';
import 'package:doan2/screens/home/CreatePost.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DSDiaDiem extends StatefulWidget {
  @override
  DSDiaDiemState createState() => DSDiaDiemState();
}

class DSDiaDiemState extends State<DSDiaDiem> {
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
          itemBuilder: (context,index)=>Container(
          child: Card(
            child: Row(
              children: <Widget>[
               TextButton(onPressed: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context)=> CreatePost(
                        id_diadiem: lsdiadiem[index].id,
                        tendiadiem: lsdiadiem[index].tendiadiem,))
                  );
                },
                  child: Text(lsdiadiem[index].tendiadiem),
                ),
              ],
            ),
          ),
          ),
      ),
    );
  }
}