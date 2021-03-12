import 'package:flutter/material.dart';

class InputBarang extends StatelessWidget {
  const InputBarang({
    Key key,
    @required this.barangController,
  }) : super(key: key);

  final TextEditingController barangController;

  @override
  Widget build(BuildContext context) {
    return TextFormField( //membuat form atau isian berupa text
      controller: barangController, //controller yang digunakan
      decoration: InputDecoration( //mengatur tampilan bagian input  
        hintText: 'Masukkan Nama Barang', //hint teks digunakan untuk memberi petunjuk pada textFormFieldnya
        icon: Icon(Icons.add_shopping_cart), //membuat ikon keranjang belanja
        border: OutlineInputBorder( //membuat border atau garis tepi untuk inputan teks
          borderRadius: BorderRadius.circular(5.0), //membuat garis tepi agak sedikit melengkung dan memiliki ketebalan 5.0
        ),
      ),
    );
  }
}