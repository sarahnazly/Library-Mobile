import 'package:flutter/material.dart';
import 'package:library_mobile/widgets/left_drawer.dart';
import 'package:library_mobile/widgets/shop_card.dart';

class MyHomePage extends StatelessWidget {
    MyHomePage({Key? key}) : super(key: key);

    final List<BookItem> items = [
        BookItem("Lihat Item", Icons.checklist, Colors.blue),
        BookItem("Tambah Item", Icons.add_shopping_cart, Colors.blueGrey),
        BookItem("Logout", Icons.logout, Colors.indigo),
    ];

    @override
    Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Book Shop',  // Text di NavBar App
            ),
            backgroundColor: Colors.indigo,
            foregroundColor: Colors.white,
          ),
          // Masukkan drawer sebagai parameter nilai drawer dari widget Scaffold
          drawer: const LeftDrawer(),
          body: SingleChildScrollView(
            // Widget wrapper yang dapat discroll
            child: Padding(
              padding: const EdgeInsets.all(10.0), // Set padding dari halaman
              child: Column(
                // Widget untuk menampilkan children secara vertikal
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                    // Widget Text untuk menampilkan tulisan dengan alignment center dan style yang sesuai
                    child: Text(
                      'Book Shop Mobile', // Text yang menandakan toko
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  // Grid layout
                  GridView.count(
                    // Container pada card kita.
                    primary: true,
                    padding: const EdgeInsets.all(20),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 3,
                    shrinkWrap: true,
                    children: items.map((BookItem item) {
                      // Iterasi untuk setiap item
                      return BookCard(item);
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),
        );
    }
}