import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}
//menggunakan stateful widget dimana akan terjadi perubahan saat fungsi set state dieksekusi
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final barangController = TextEditingController(); //Controller untuk menampung inputan user pada textformfield barang
  final hargaController = TextEditingController(); //Controller untuk menampung inputan user pada textformfield harga
  String barang = ""; //variabel untuk nama barang
  int harga = 0; //variabel untuk harga
  int total = 0; //variabel untuk menghitung total

  @override
  Widget build(BuildContext context) { //widget yang dijalankan saat dibuild
    return MaterialApp(
      //judul untuk aplikasi flutter
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false, //untuk menghilangi logo debug pada hasil run
      theme: ThemeData( 
        primarySwatch: Colors.purple, 
        visualDensity: VisualDensity.adaptivePlatformDensity, //mengatur tampilan agar sesuai dengan platform yang dirun
      ),
      home: Scaffold( //mengatur halaman home menggunakan Scaffold untuk mengatur tampilan keseluruhan
        appBar: AppBar( //mengatur tampilan pada bagian atas halaman
          title: Text('BelanjaKu'), //judul aplikasi
        ),
        body: Container( //membuat pengaturan untuk bagian utama halaman yaitu body
          margin: EdgeInsets.all(8), //mengatur margin atau batas keseluruhan
          child: Column( //membuat kolom untuk membagi widget per bagian
            mainAxisAlignment: MainAxisAlignment.start, //mengatur posisi kolom
            children: <Widget>[ //berfungsi untuk menampung banyak widget
              TextFormField( //membuat form atau isian berupa text
                controller: barangController, //controller yang digunakan
                decoration: InputDecoration( //mengatur tampilan bagian input  
                  hintText: 'Masukkan Nama Barang', //hint teks digunakan untuk memberi petunjuk pada textFormFieldnya
                  icon: Icon(Icons.add_shopping_cart), //membuat ikon keranjang belanja
                  border: OutlineInputBorder( //membuat border atau garis tepi untuk inputan teks
                    borderRadius: BorderRadius.circular(5.0), //membuat garis tepi agak sedikit melengkung dan memiliki ketebalan 5.0
                  ),
                ),
              ),
              SizedBox( //box yang digunakan untuk memberi jarak antar textformfield
                height: 15, //unkuran tinggi box
              ),
              TextFormField( //membuat form atau isian berupa teks (harga)
                controller: hargaController, //controller yang digunakan untuk inputan harga
                decoration: InputDecoration( //mengatur tampilan bagian input
                  hintText: 'Masukkan Harga Barang', //hint teks digunakan untuk memberi petunjuk pada textFormFieldnya
                  icon: Icon(Icons.money), //membuat ikon keranjang belanja
                  border: OutlineInputBorder( //membuat border atau garis tepi untuk inputan teks
                    borderRadius: BorderRadius.circular(5.0), //membuat garis tepi agak sedikit melengkung dan memiliki ketebalan 5.0
                  ),
                ),
                inputFormatters: [FilteringTextInputFormatter.digitsOnly], //mengatur penerimaan input hanya untuk angka
                keyboardType: TextInputType.number, //mengatur tampilan keyboard ha untuk angka
              ),
            ],
          ),
        ),
      ),
    );
  }
}
