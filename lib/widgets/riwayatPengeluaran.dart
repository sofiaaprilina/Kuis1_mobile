import 'package:flutter/material.dart';

class RiwayatPengeluaran extends StatelessWidget {
  const RiwayatPengeluaran({
    Key key,
    @required this.listViewItem,
  }) : super(key: key);

  final List<String> listViewItem; //list untuk item

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: listViewItem.map((String value) { //map pada list
          return Container(
            margin: EdgeInsets.all(10),
            child: Text(
              value,
              style: TextStyle(fontSize: 15),
            ));
      }).toList()),
    );
  }
}