import 'dart:convert';

import 'package:doan2/model/UserObject.dart';
import 'package:doan2/provider/user_provider.dart';
import 'package:doan2/screens/home/Hearder.dart';
import 'package:doan2/screens/home/Post.dart';
import 'package:doan2/screens/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:getwidget/getwidget.dart';
import 'package:doan2/theme/colors/light_colors.dart';
import 'package:doan2/widgets/task_column.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../account/account_page.dart';
import 'package:doan2/widgets/top_container.dart';
import '../place/place.dart';
import '../notifications/notifications.dart';
import 'CreatePost.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import '../map/Map.dart';

class HomeTab extends StatefulWidget {
  @override
  HomeTabList createState() => HomeTabList();
}

class HomeTabList extends State<HomeTab> {
//  final UserObject user;
//   loaduser() async {
//     final data = await UserProvider.get();
//     setState(() {
//       user = data;
//     });
//   }

  // @override
  // void initState() {
  //   super.initState();
  //   loaduser();
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          Card(
            child: ListTile(
              leading: CircleAvatar(
                child: Text('HN'),
              ),
              title: OutlinedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CreatePost(id_diadiem: 0,tendiadiem:" ",)));
                },
                child: Text('What your mind favorite',
                    style: TextStyle(color: Colors.black)),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  )),
                ),
              ),
            ),
          ),
          Container(
            height: 630,
            child: Post(),
          )
        ],
      ),
    );
  }
}

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DataState();
  }
}

class DataState extends State<Home> {
  int _currentIndex = 0;
  List childrent = [
    Container(
      child: HomeTab(),
    ),
    Container(
      child: Place(),
    ),
    Container(
      child: Service(),
    ),
    Material(
      child: Center(
        child: Map(10.771595, 106.6991629),
      ),
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderWidget(),
      body: Center(
        child: childrent[_currentIndex],
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        showElevation: true,
        itemCornerRadius: 24,
        curve: Curves.easeIn,
        onItemSelected: (index) => setState(() => _currentIndex = index),
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            icon: Icon(Icons.apps),
            title: Text('Trang chủ'),
            activeColor: Colors.red,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.add_location),
            title: Text('Địa điểm'),
            activeColor: Colors.purpleAccent,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.campaign),
            title: Text('Thông báo'),
            activeColor: Colors.pink,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.map_outlined),
            title: Text('Bản đồ'),
            activeColor: Colors.blue,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(48);
}
