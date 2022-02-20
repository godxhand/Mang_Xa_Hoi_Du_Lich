import 'package:doan2/screens/notifications/LinkPost.dart';
import 'package:flutter/material.dart';
import 'package:doan2/theme/colors/light_colors.dart';
import 'package:getwidget/getwidget.dart';

class Service extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ServiceState();
}

class ServiceState extends State<Service> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: LightColors.kLightYellow,
        body: ListView(
          children: [
            Card(
              child: GFListTile(
                avatar: GFAvatar(
                  backgroundImage: AssetImage(
                    'assets/images/logo-2.png',
                  ),
                  shape: GFAvatarShape.square,
                  backgroundColor: GFColors.TRANSPARENT,
                ),
                titleText: 'Title',
                subTitleText: 'LIKE hoac DISLIKE',
                icon: IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LinkPost()));
                    },
                    icon: Icon(Icons.arrow_forward_outlined)),
              ),
            ),
            Card(
              child: GFListTile(
                avatar: GFAvatar(
                  backgroundImage: AssetImage(
                    'assets/images/logo-2.png',
                  ),
                  shape: GFAvatarShape.square,
                  backgroundColor: GFColors.TRANSPARENT,
                ),
                titleText: 'Title',
                subTitleText: 'LIKE hoac DISLIKE',
                icon: IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LinkPost()));
                    },
                    icon: Icon(Icons.arrow_forward_outlined)),
              ),
            ),
            Card(
              child: GFListTile(
                avatar: GFAvatar(
                  backgroundImage: AssetImage(
                    'assets/images/logo-2.png',
                  ),
                  shape: GFAvatarShape.square,
                  backgroundColor: GFColors.TRANSPARENT,
                ),
                titleText: 'Title',
                subTitleText: 'LIKE hoac DISLIKE',
                icon: IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LinkPost()));
                    },
                    icon: Icon(Icons.arrow_forward_outlined)),
              ),
            ),
          ],
        ));
  }
}
