import 'package:flutter/material.dart';

class DropdownJumlah extends StatelessWidget {
  const DropdownJumlah({
    Key key,
    @required this.jumlah,
    @required this.newValue,
    @required this.dropdownOnChanged,
  }) : super(key: key);

  final List<String> jumlah;
  final String newValue;
  final Function dropdownOnChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          'Masukkan Jumlah',
          style: TextStyle(fontSize: 16),
        ),
        DropdownButton<String>(
          items: jumlah.map(
            (String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            },
          ).toList(),
          value: newValue,
          onChanged: dropdownOnChanged,
        ),
      ],
    );
  }
}