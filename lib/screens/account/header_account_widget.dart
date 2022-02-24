import 'package:doan2/model/UserObject.dart';
import 'package:doan2/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as developer;

import 'big_avatar_user_widget.dart';
import 'menu_item_widget.dart';

class HeaderAccountWidget extends StatefulWidget {
  static const ROUTE_NAME = 'HeaderAccountWidget';
  @override
  _HeaderAccountWidgetState createState() => _HeaderAccountWidgetState();
}

class _HeaderAccountWidgetState extends State<HeaderAccountWidget> {
  static const TAG = 'HeaderAccountWidget';
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).cardColor,
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(
              vertical: 16,
              horizontal: 16,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    BigAvatarUserWidget(),
                    // FutureBuilder<UserObject>(
                    //   future: UserProvider.getUser(),
                    //   builder: (context,snapshot){
                    //     if(snapshot.hasData){
                    //       return Text(snapshot.data!.name,
                    //         // style: Theme.of(context).textTheme.bodyText2,
                    //       );
                    //     }
                    //     return Center();
                    //   },
                    // ),
                    Padding(
                      padding: EdgeInsets.only(top: 8),
                     child: Text("Ten User",
                    style: Theme.of(context).textTheme.bodyText2,),
                    )
                  ],
                ),
                Expanded(
                    child: Container(
                  alignment: Alignment.center,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          child: MenuItemWidget(
                        title: '0',
                        content: 'like',
                      )),
                      Expanded(
                          child: MenuItemWidget(
                        title: '0',
                        content: 'dislike',
                      )),
                    ],
                  ),
                ))
              ],
            ),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Text(
              'Do an moi',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
            width: double.infinity,
            child: OutlineButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4))),
              onPressed: () {

              },
              child: Text(
                'Profile User',
                style: Theme.of(context).textTheme.subtitle2,
              ),
            ),
          )
        ],
      ),
    );
  }
}
