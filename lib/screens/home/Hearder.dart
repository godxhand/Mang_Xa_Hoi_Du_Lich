import 'package:doan2/screens/account/account_page.dart';
import 'package:doan2/screens/seacher/Seacher.dart';
import 'package:flutter/material.dart';
import '../place/place.dart';
import 'package:doan2/theme/colors/light_colors.dart';

class HeaderWidget extends StatelessWidget with PreferredSizeWidget {
  static const Color kDarkYellow = Color(0xFFF9BE7C);
  @override
  Widget build(BuildContext context) {
    return Material(
      color: kDarkYellow,
      elevation: 2,
      child: SafeArea(
        child: Container(
          child: Row(
            children: <Widget>[
              Expanded(
                  child: Text(
                'Knight',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
              ),
              IconButton(
                  icon: Icon(
                    Icons.search_sharp,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Seacher()));
                  }),
              IconButton(
                  icon: Icon(
                    Icons.account_box_rounded,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AccountPage()));
                  }),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60);
}
