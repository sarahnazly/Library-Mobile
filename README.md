# Library Inventory Mobile

<details>

<summary>Tugas 7</summary>

<h1>Perbedaan Utama antara Stateless dan Stateful Widget dalam Konteks Pengembangan Aplikasi Flutter</h1>

<h2>Stateless Widget</h2>

`Stateless` widgets merupakan widget yang bersifat statis atau tidak dapat berubah setelah dibuat. Widget ini digunakan untuk tampilan yang tidak memerlukan perubahan atau interaksi yang kompleks. `Stateless` widgets hanya memiliki `build` method dan tidak menyimpan data yang dapat berubah. 

<h2>Stateful Widget</h2>

`Stateful` widgets merupakan widget yang dapat berubah atau memiliki keadaan (state) yang dapat diperbarui. Widget ini digunakan untuk tampilan yang memerlukan interaksi pengguna, input, atau perubahan berdasarkan data yang dapat berubah. `Stateful` widgets memiliki dua kelas terpisah, yaitu kelas widget yang bersifat statis dan kelas `State` yang dapat berubah.

<h1>Widget yang Digunakan pada Tugas 7</h1>

1. `MyApp` (Stateless Widget) : Widget utama yang mendefinisikan aplikasi Flutter dan mendefinisikan tema serta merujuk ke halaman utama.

2. `MyHomePage` (Stateless Widget) : Widget yang menampilkan halaman utama aplikasi dan membuat daftar item dengan menggunakan `GridView` yang memuat widget `BookCard`.

3. `BookItem` (Class) : Widget yang mewakili objek yang berisi data item buku, seperti nama, ikon, dan warna. Widget ini digunakan untuk membuat daftar item buku dalam `MyHomePage`.

4. `BookCard` (Stateless Widget) : Widget yang menampilkan setiap item buku dalam bentuk kartu (card). Widget ini menggunakan `Material` untuk memberikan latar belakang dengan warna dari `BookItem`. Widget ini menggunakan `InkWell` untuk membuat area yang responsif terhadap sentuhan (tappable), sehingga ketika diklik akan menampilkan `SnackBar` yang memberi informasi tentang item yang diklik. Widget ini juga dapat menampilkan ikon dan teks yang sesuai dengan item buku dari `BookItem`.

5. `SingleChildScrollView` : Widget yang menyediakan kemampuan untuk melakukan scroll pada konten yang melebihi ukuran layar. Widget ini dapat membungkus `Padding` yang berisi `Column`.

6. `Padding` : Widget yang memberikan jarak antara widget dengan widget lainnya. Widget ini digunakan untuk memberikan jarak antara tepi layar dengan konten, serta antara judul dengan grid layout.

7. `Column` : Widget yang menampilkan widget-widget lainnya secara vertikal. Widget ini digunakan untuk menampilkan judul dan grid layout.

8. `Text` : Widget yang menampilkan teks dengan berbagai atribut, seperti alignment, style, dan font. Widget ini digunakan untuk menampilkan judul aplikasi.

9. `GridView.count` : Widget yang menampilkan widget-widget lainnya dalam bentuk grid dengan jumlah kolom yang ditentukan. Widget ini digunakan untuk menampilkan tiga tombol sederhana dengan ikon dan teks.

10. `Icon` : Widget yang menampilkan ikon dengan berbagai atribut, seperti warna, ukuran, dan jenis. Widget ini digunakan untuk menampilkan ikon pada setiap item pada grid layout.

<h1>Implementasi Checklist</h1>

Untuk langkah pertama, saya membuat direktori `library_mobile` sebagai direktori proyek Flutter yang akan dibuat. Setelah itu, saya membuat aplikasi Flutter dengan nama `library_mobile` dengan perintah berikut.
```bash
flutter create library_mobile
```
Kemudian saya membuat file baru `menu.dart` dalam `library_mobile/lib` dan memberikan import berikut pada awal file.
```dart
import 'package:flutter/material.dart';
```
Kemudian saya memindahkan class `MyHomePage` dan `_MyHomePageState` dari file `main.dart` ke dalam file `menu.dart` dan menambahkan warna tertentu untuk masing-masing tombol dari widget `BookItem` agar memiliki warna yang berbeda-beda sebagai penerapan dari `BONUS` pada tugas 7 ini, sehingga isi dari file `menu.dart` adalah sebagai berikut.
```dart
import 'package:flutter/material.dart';

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
              'Library Inventory',
            ),
          ),
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
                      'Library Inventory Mobile', // Text yang menandakan toko
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

class BookItem {
  final String name;
  final IconData icon;
  final Color color;
  BookItem(this.name, this.icon, this.color);
}

class BookCard extends StatelessWidget {
  final BookItem item;

  const BookCard(this.item, {super.key}); // Constructor

  @override
  Widget build(BuildContext context) {
    return Material(
      color: item.color,
      child: InkWell(
        // Area responsive terhadap sentuhan
        onTap: () {
          // Memunculkan SnackBar ketika diklik
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!")));
        },
        child: Container(
          // Container untuk menyimpan Icon dan Text
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
```
Agar program tetap dapat mengakses isi dari file `menu.dart`, maka pada file `main.dart` ditambahkan import sebagai berikut.
```dart
import 'package:library_mobile/menu.dart';
```

Tampilan akhir dari tugas 7 adalah sebagai berikut.
![Tampilan Hasil Tugas 7](Tugas-7.png)

<h2>Melakukan Add, Commit, dan Push ke GitHub</h2>

Kita dapat melakukan `add` dari semua file yang diperbarui dengan perintah 
```bash
git add .
``` 
kemudian melakukan `commit` "Tugas 7" dengan perintah 
```bash
git commit -m "Tugas 7"
``` 
dan yang terakhir melakukan `push` ke repository GitHub dengan perintah
```bash
git push -u origin main
```

</details>