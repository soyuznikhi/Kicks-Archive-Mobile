# **KICKS ARCHIVE**

## Tugas 8
1. Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement() pada Flutter. Dalam kasus apa sebaiknya masing-masing digunakan pada aplikasi Football Shop kamu?
   - .push() menambahkan halaman diatas halaman yang sedang kita gunakan seperti sebuah stack. Dengan sifat stack, kita bisa mengakses halaman sebelumnya dengan menggunakan .pop(). Halaman yang sedang aktif akan di pop dan kembali ke halaman sebelumnya. Contoh kasus yang menggunakan .push() adalaha ketika user sedang melihat details dari sebuah product, dan ingin kembali ke halaman list products.
   - .pushReplacement() berbeda dengan .push(), dia menggantikan halaman yang aktif dengan halaman baru dan tidak seperti stack. Jadi halaman yang aktif di-replace oleh halaman baru sehingga akses ke halaman sebelumnya tidak bisa. Contoh kasusnya adalah saat user login dan pergi ke halaman utama. Pada kondisi ini user tidak perlu kembali lagi ke halaman login karena sudah terautentikasi.  
   
2. Bagaimana kamu memanfaatkan hierarchy widget seperti Scaffold, AppBar, dan Drawer untuk membangun struktur halaman yang konsisten di seluruh aplikasi?
   - Scaffold sebagai kerangka utama atau container yang membungkus kumpulan widget, agar bisa dilihat sebagai satu kesatuan.
     - Pada aplikasi ini, salah satu contoh penggunaan Scaffold adalaha untuk membungkus AppBar dan Drawer. 
   - AppBar sebagai bar pada atas aplikasi, layaknya sebuah navbar. AppBar menjadi child dari Scaffold. 
   - Drawer sebagai menu slide in dari samping layar untuk navigasi seperti navbar. Drawer menjadi child dari Scaffold.
  
3. Dalam konteks desain antarmuka, apa kelebihan menggunakan layout widget seperti Padding, SingleChildScrollView, dan ListView saat menampilkan elemen-elemen form? Berikan contoh penggunaannya dari aplikasi kamu.
   - Padding menambahkan jarak di sekitar widget agar terlihat lebih rapi dan tidak terlalu berdempet antar widget. Contohnya pada productlist_form.dart diberikan padding dengan EdgeInset 8.0 untuk memberikan jarak dengan field input lainnya. 
   - SingleChildScrollView membuat halaman yang bisa discroll oleh user agar item yang ada bisa dilihat melalui scrolling. Contohnya pada productlist_form.dart diberikan SingleChildScrollView pada pop up yang muncul setelah product berhasil dbuat. Hal ini bertujuan agar item yang ada pada pop up widget tidak tumpah dan informasi yang tidak muat dapat dilihat dengan scrolling. 
   - ListView memberikan tampilan seperti list yang dapat discroll, cocok untuk menyimpan item yang akan ditambahkan terus kedepannya. Contohnya pada left_drawer.dart diberikan ListView agar dapat menambahkan banyak ListTile sebagai navigasi ke halaman-halaman aplikasi lainnya. 
  
4. Bagaimana kamu menyesuaikan warna tema agar aplikasi Football Shop memiliki identitas visual yang konsisten dengan brand toko?
   - Agar warna tema aplikasi sesuai dengan brand, penyesuaian warna dapat dilakukan pada main.dart, tepatnya pada colorScheme. Melalui colorScheme, ada primarySwatch yang bisa diatur Colornya dan ada secondary yang bisa diatur juga Colornya. Jadi keseluruhan aplikasi dapa mengikuti tema warna tersebut.

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
