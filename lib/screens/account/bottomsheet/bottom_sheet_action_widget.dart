import 'package:doan2/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:doan2/screens/account/app_context.dart';
import 'package:doan2/screens/account/bottomsheet/bottom_sheet_action.dart';

class BottomSheetActionWidget extends StatelessWidget {
  final BottomSheetAction action;

  BottomSheetActionWidget(this.action);

  @override
  Widget build(BuildContext context) {
    void _logout() async{
    final reponse = await UserProvider.logout();
    }
    return InkWell(
      highlightColor: Colors.blue.withOpacity(0.1),
      splashColor: Colors.blue.withOpacity(0.3),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Row(
          children: [
            Icon(action.iconData),
            SizedBox(
              width: 16,
            ),
            Text(
              action.title,
              style: context.textTheme.subtitle1,
            )
          ],
        ),
      ),
      onTap: () {
        _logout();
        Navigator.pop(context, action);
      },
    );
  }
}
