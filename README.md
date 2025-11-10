# **KICKS ARCHIVE**

## Tugas 8


## Tugas 7
1.  Jelaskan apa itu widget tree pada Flutter dan bagaimana hubungan parent-child (induk-anak) bekerja antar widget.
    - Widget tree adalaha sebuah hierarki dari UI flutter, di mana setiap elemen seperti layout, text, button, dan sebagainya direpresentasikan oleh sebuah widget.
    - Dalam widget tree, ada parent dan child widget. Parent widget berfungsi untuk mendefinisikan sifat-sifat dari anaknya, misalnya posisi, size, dan color. Child widget akan meng-inherit sifat parent widgetnya dan bisa memiliki sifat yang lebih spesifik. Child widget bisa menjadi parent widget jika diberikan child widget lagi di dalamnya.
2. Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya.
    - StatelessWidget: Kelas yang di-extend oleh widget yang statenya tidak akan berubah-ubah selama aplikasi berjalan.
    - Scaffold: Widget yang menyediakan kerangka utama dan template untuk UI, seperti appBar (seperti navbar) dan body.
    - Appbar: Wdiget template untuk navbar.
    - Text: Menampilkan text.
    - Padding: Menambahkan padding pada child widgetnya.
    - Column: Menyusun child widget secara vertikal.
    - Row: Menyusun child widget secara horizontal.
    - SizedBox: Membuat space kosong.
    - Center: Membuat child widget menjadi center pada parent widgetnya.
    - GridView: Membuat child widget dikelompokkan menjadi beberapa kolom.
    - Card: Tampilan kotak (card).
    - Container: Sebagai container widget bagi child widgetnya sehingga bisa diberikan banyak definisi seperti padding, border, dsb.
    - MediaQuery: Mengatur lebar secara proporsional.
    - Icon: Untuk menampilkan icon.
    - Material: Mendefinisikan karakteristik seperti background dan elevation.
    - InkWell: Menampilkan effect ripple saat ditekan.
    - SnackBar: Menampilkan pop up di bawah layar.
3. Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini sering digunakan sebagai widget root.
    - MaterialApp merupakan widget yang membungkus semua widget aplikasi.
    - Menyediakan widget lain seperti title atau home.
    - Mengatur tema seperti colorScheme.
    - Dapat menyambungkan satu page dengan lainnya.
4. Jelaskan perbedaan antara StatelessWidget dan StatefulWidget. Kapan kamu memilih salah satunya?
    - Stateless widget merupakan widget yang datanya tetap dan tidak akan berubah-ubah, misalnya pada sebuah tombol yang kontennya tidak berubah. Stateless widget digunakan ketika widget yang ingin ditampilkan bersifat statis.
    - Stateful widget merupakan widget yang datanya bisa berubah selama aplikasi berjalan, misalnya pada sebuah checkbox yang muncul tanda centang ataupun sebuah counter yang bertambah terus. Stateful widget digunakan ketika widget yang ingin ditampilkan bersifat dinamis.
5. Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di metode build?
    - BuildContext merupakan informasi tentang sebuah widget dan lokasinya pada widget tree. 
    - Metode build menerima parameter bertipe BuildContext agar bisa mengetahui pada widget mana yang harus di build. 
6. Jelaskan konsep "hot reload" di Flutter dan bagaimana bedanya dengan "hot restart".
    - Hot reload dan hot restart merupakan cara untuk mengaplikasikan perubahan kode saat development.
    - Hot reload:
      - Mengaplikasikan perubahan dengan cepat dan mempertahankan state widget yang sudah ada sebelumnya.
    - Hot Restart:
      - Meng-compile ulang kode dan aplikasi mulai lagi dari awal (state widget juga) sehingga lebih lama dibandingkan hot reload, tetapi masih cepat secara waktu. 
