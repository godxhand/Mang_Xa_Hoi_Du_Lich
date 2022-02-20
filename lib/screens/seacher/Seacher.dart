import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class Seacher extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SeacherSate();
  }
}

class SeacherSate extends State<Seacher> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Material(
              color: Theme.of(context).primaryColor,
              child: Container(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        ),
                        child: TextField(
                          autofocus: false,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              hintText: "Search",
                              prefixIcon: Icon(Icons.search),
                              border: InputBorder.none),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.search_sharp),
                      onPressed: () {},
                    )
                  ],
                ),
              )),
        ),
        body: Card(
          child: InkWell(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(10),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: OutlinedButton(
                      onPressed: () {},
                      child: Text('dia diem'),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: OutlinedButton(
                      onPressed: () {},
                      child: Text('khach san'),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: OutlinedButton(
                      onPressed: () {},
                      child: Text('quan an'),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: OutlinedButton(
                      onPressed: () {},
                      child: Text('nhu cau'),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: OutlinedButton(
                      onPressed: () {},
                      child: Text('...'),
                    ),
                  )
                ],
              ),
            ),
            onTap: () {},
          ),
        ));
  }
}
