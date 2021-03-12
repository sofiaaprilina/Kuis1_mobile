import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputHarga extends StatelessWidget {
  const InputHarga({
    Key key,
    @required this.hargaController,
  }) : super(key: key);

  final TextEditingController hargaController;

  @override
  Widget build(BuildContext context) {
    return TextFormField( //membuat form atau isian berupa teks (harga)
      controller: hargaController, //controller yang digunakan untuk inputan harga
      decoration: InputDecoration( //mengatur tampilan bagian input
        hintText: 'Masukkan Harga Barang', //hint teks digunakan untuk memberi petunjuk pada textFormFieldnya
        icon: Icon(Icons.money), //membuat ikon keranjang belanja
        border: OutlineInputBorder( //membuat border atau garis tepi untuk inputan teks
          borderRadius: BorderRadius.circular(5.0), //membuat garis tepi agak sedikit melengkung dan memiliki ketebalan 5.0
        ),
      ),
      inputFormatters: [FilteringTextInputFormatter.digitsOnly], //mengatur penerimaan input hanya untuk angka
      keyboardType: TextInputType.number, //mengatur tampilan keyboard hanya untuk angka
    );
  }
}