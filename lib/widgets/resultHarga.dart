import 'package:flutter/material.dart';

class ResultHarga extends StatelessWidget {
  const ResultHarga({
    Key key,
    @required this.harga,
  }) : super(key: key);

  final int harga;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5, bottom: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Total Harga",
            style: TextStyle(fontSize: 18),
          ),
          Text(
            '$harga',
            style: TextStyle(fontSize: 25),
          )
        ],
      ),
    );
  }
}