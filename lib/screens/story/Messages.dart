import 'package:flutter/material.dart';
import 'Bottom.dart';

class Story extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StoryState();
  }
}

class StoryState extends State<Story> {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Expanded(
              child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.vertical(
                    bottom: Radius.circular(8)),
                image: DecorationImage(
                    image: AssetImage('assets/images/VN.jpg'),
                    fit: BoxFit.fill)),
          )),
          ContentInputWidget()
        ],
      ),
    );
  }
}
