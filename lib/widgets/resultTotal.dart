import 'package:flutter/material.dart';

class ResultTotal extends StatelessWidget {
  const ResultTotal({
    Key key,
    @required this.total, //pemanggilan di konstruktor
  }) : super(key: key);

  final int total; //variabel total

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.0,
      width: double.infinity,
      child: Text(
        "Total Pengeluaran: "+ '$total', //memanggil variabel total
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 14, color: Colors.black87),
      ),
      decoration: BoxDecoration( //untuk membuat border agar tampilan mirip box
        border: Border(
          top: BorderSide(
            color: Colors.purple,
          ),
          right: BorderSide(
            color: Colors.purple,
          ),
          left: BorderSide(
            color: Colors.purple,
          ),
          bottom: BorderSide(
            color: Colors.purple,
          ),
        )
      ),
    );
  }
}
