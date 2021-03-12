import 'package:flutter/material.dart';

class ButtonHitung extends StatelessWidget {
  const ButtonHitung({
    Key key,
    @required this.konvertHandler,
  }) : super(key: key);

  final Function konvertHandler;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      child: RaisedButton(
        onPressed: konvertHandler,
        color: Colors.purple,
        textColor: Colors.white,
        child: Text("Hitung Total"),
      ),
    );
  }
}