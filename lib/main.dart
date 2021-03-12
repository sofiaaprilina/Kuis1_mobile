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
  var jumlah = ["1", "2", "3", "4", "5"]; //list untuk jumlah barang
  String newValue = "1"; //variabel untuk mengubah value pada dropdown
  List<String> listViewItem = []; //list untuk ditampilkan pada listView

  void dropdownOnChanged(String changeValue) {
    //fungsi yang dipanggil setiap ada perubahan 
    setState(() {
      //mengubah nilai value pada dropdown sesuai dengan value yang dipilih
      newValue = changeValue;
    });
  }

  void hitungHarga() { //fungsi untuk menghitung harga barang
    setState(() { //fungsi yang akan dipanggil setiap ada perubahan
      barang = barangController.text;//mengisi nilai variabel barang sesuai dengan inputan yang ditampung controller
      harga = int.parse(hargaController.text); //mengisi nilai variabel harga sesuai dengan inputan yang ditampung controller dan disini diubah menjadi int untuk menyesuaikan tipe variablal harga  
      if (newValue == "1"){ //kondisi ketika value pada dropdown bernilai 1
        harga = harga * 1; //nilai variabel harga terbaru
      }
      //kondisi ketika value pada dropdown bernilai 2 atau kondisi pertama tidak terpenuhi
      else if (newValue == "2"){
        harga = harga * 2; //nilai variabel harga terbaru
      }
      //kondisi ketika value pada dropdown bernilai 3 atau kondisi 1 dan 2 tidak terpenuhi
      else if (newValue == "3"){
        harga = harga * 3; //nilai variabel harga terbaru
      }
      //kondisi ketika value pada dropdown bernilai 4 atau kondisi 1,2, dan 3 tidak terpenuhi
      else if (newValue == "4"){
        harga = harga * 4; //nilai variabel harga terbaru
      }
      //kondisi ketika value pada dropdown bernilai 2 atau semua kondisi di atas tidak terpenuhi
      else{
        harga = harga * 5; //nilai variabel harga terbaru
      }
      total+=harga; //menghitung total pengeluaran berdasarkan harga dari tiap barang-barang
      listViewItem.add("$barang "+ '$harga'); //untuk menambahkan daftar pada ListView
    });
  }


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
              Row(
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
              ),
              Container(
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
              ),
              Container(
                width: double.infinity,
                height: 50,
                child: RaisedButton(
                  onPressed: hitungHarga,
                  color: Colors.purple,
                  textColor: Colors.white,
                  child: Text("Hitung Total"),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 10),
                child: Text(
                  "Riwayat Pengeluaran Belanja",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Expanded(
                child: ListView(
                  children: listViewItem.map((String value) {
                    return Container(
                      margin: EdgeInsets.all(10),
                      child: Text(
                        value,
                        style: TextStyle(fontSize: 15),
                      ));
                }).toList()),
              ),
              Container(
                height: 30.0,
                width: double.infinity,
                child: Text(
                  "Total Pengeluaran: "+ '$total',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, color: Colors.black87),
                ),
                decoration: BoxDecoration(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
