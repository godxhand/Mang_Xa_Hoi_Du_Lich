import 'package:doan2/model/UserObject.dart';
import 'package:doan2/model/baivietObject.dart';
import 'package:doan2/provider/baiviet_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class Post extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return PostState();
  }
}

class PostState extends State<Post>{
  List<BaivietObject> lsbaiviet = [];
  _loadbaiviet() async {
    final data = await BaiVietProvider.getall();
    setState(() { });
    lsbaiviet = data;
  }

  @override
  void initState() {
    super.initState();
    _loadbaiviet();
  }
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: ListView.builder(
       itemCount:lsbaiviet.length,
       itemBuilder:(context, index)=>Container(
         child:    Card(
           shape: RoundedRectangleBorder(
             borderRadius: BorderRadius.circular(30),
           ),
           color: Colors.white,
           shadowColor: Colors.black26,
           child: Column(
             children: [
               ListTile(
                 leading: CircleAvatar(
                   child: Text('TL'),
                 ),
                 title: Text("Khanh Sang"
  //                   lsbaiviet[index].user.name
                 ),
                 subtitle: Align(
                   alignment: Alignment.centerLeft,
                   child: Icon(Icons.person_outline_sharp),
                 ),
                 trailing: PopupMenuButton(
                   icon: Icon(Icons.more_horiz),
                   itemBuilder: (context) => [
                     PopupMenuItem(
                         child: ListTile(
                           leading: Icon(Icons.flag_outlined),
                           title: Text('Luu bai viet'),
                           subtitle: Text('Add this to saveed item'),
                         )),
                     PopupMenuItem(
                         child: ListTile(
                           leading: Icon(Icons.flag_outlined),
                           title: Text('An bai viet'),
                           subtitle: Text('Add this to saveed item'),
                         )),
                   ],
                 ),
               ),
               Container(
                 width: double.infinity,
                 child: Padding(
                   padding: EdgeInsets.all(10),
                   child: ReadMoreText(
                     lsbaiviet[index].noidung,
                     style: TextStyle(color: Colors.black),
                     trimCollapsedText: 'xem them',
                     trimExpandedText: 'thu gon',
                   ),
                 ),
               ),
               Image.asset(
                 'assets/images/VN.jpg',
                 height: 200,
                 width: 400,
               ),
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: <Widget>[
                   Row(
                     children: <Widget>[
                       Row(
                         mainAxisAlignment: MainAxisAlignment.end,
                         children: [
                           IconButton(
                               onPressed: () {},
                               icon: Icon(
                                 Icons.sentiment_satisfied_alt_rounded,
                                 color: Colors.black,
                               )),
                           Text(lsbaiviet[index].like.toString()),
                         ],
                       ),
                       Row(
                         children: <Widget>[
                           IconButton(
                               onPressed: () {},
                               icon: Icon(
                                 Icons.sentiment_dissatisfied_outlined,
                                 color: Colors.black,
                               )),
                           Text(lsbaiviet[index].dislike.toString()),
                         ],
                       )
                     ],
                   ),
                   Row(
                     children: <Widget>[
                       Text(lsbaiviet[index].view.toString()),
                       IconButton(
                           onPressed: () {},
                           icon: Icon(
                             Icons.remove_red_eye_outlined,
                             color: Colors.black,
                           ))
                     ],
                   )
                 ],
               )
             ],
           ),
         ),
       ),
     ),
   );
  }

}