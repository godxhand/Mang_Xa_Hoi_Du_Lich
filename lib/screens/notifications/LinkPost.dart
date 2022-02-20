import 'package:flutter/material.dart';

class LinkPost extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LinkPostState();
  }
}

class LinkPostState extends State<LinkPost> {
  static const Color kDarkYellow = Color(0xFFF9BE7C);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bai viet'),
        backgroundColor: kDarkYellow,
      ),
      body: Card(
        color: Colors.white,
        shadowColor: Colors.grey.shade300,
        child: Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                child: Text('TL'),
              ),
              title: Text("tieu linh"),
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
                child: Text(
                  'gio dua canh truc la da \n'
                  'Hoa roi cua phat biet tua vao ai \n',
                  softWrap: true,
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
                        Text('10'),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.sentiment_satisfied_alt_rounded,
                              color: Colors.black,
                            ))
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text('10'),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.sentiment_dissatisfied_outlined,
                              color: Colors.black,
                            ))
                      ],
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text('10'),
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
    );
  }
}
