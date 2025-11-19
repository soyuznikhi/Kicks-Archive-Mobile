# **KICKS ARCHIVE**

## Tugas 9
1. Mengapa kita perlu membuat model Dart saat mengambil/mengirim data JSON? Apa konsekuensinya jika langsung memetakan Map<String, dynamic> tanpa model (terkait validasi tipe, null-safety, maintainability)?
    - Dengan membuat model Dart, kita dapat membungkus data JSON dalam suatu class custom. Contohnya pada class ProductEntry di project ini. Hal ini berfungsi untuk membuat data JSON memiliki bentuk yang mirip saat pada project Django sehingga kita dapat mengaksesnya sebagai sebuah object ProductEntry dan mengakses fieldnya, seperti name, price, description, dll tanpa harus mengakses Map secara manual. Apabila ada perubahan dalam model Django, kita bisa menyesuaikan model Dart ini juga dengan mudah.
    - Jika menggunakan Map secara langsung, kita tidak bisa menjamin tipe data yang dipegang oleh key pada Map tersebut. Dengan menggunakan sebuah model custom, kita dapat memvalidasi tipe data yang didapatkan dari Map, yaitu melalui variabel class yang sudah di assign dengan tipe data yang sesuai. 
    - Data null dapat dihandle melalui class yang membungkusnya, misalnya dengan memberikan default value. Hal ini mencegah null check lagi pada widget-widget lainnya.
  
2. Fungsi package http dan CookieRequest dalam tugas ini? Jelaskan perbedaan peran http vs CookieRequest.
   - Http berperan untuk mengirim GET/POST dan menerima response.
   - CokkieRequest berperan sebagai wrapper untuk mengelola cookie, session, dan login/logout Django agar bisa diintegrasi dengan Provider dalam proses authentication. 
3. Mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter?
   - Cookies dan session dibagikan ke semua komponen agar semua komponen memiliki cookie dan session yang sama. Hal ini mencegah adanya komponen yang memiliki cookie dan session yang berbeda dengan lainnya. Kita ingin user memiliki state yang sama pada semua komponen flutter. Aplikasi harus mengenal user beserta state-nya dalam semua komponen/fitur aplikasi, misalnya mengingat preferensi user dan apakah user sudah login atau belum.
4. Jelaskan konfigurasi konektivitas yang diperlukan agar Flutter dapat berkomunikasi dengan Django. Mengapa kita perlu menambahkan 10.0.2.2 pada ALLOWED_HOSTS, mengaktifkan CORS dan pengaturan SameSite/cookie, dan menambahkan izin akses internet di Android? Apa yang akan terjadi jika konfigurasi tersebut tidak dilakukan dengan benar?
   - Menambahkan 10.0.2.2 pada ALLOWED_HOSTS diperlukan agar Android Studio emulator diizinkan melakukan koneksi kepada project Django.
   - CORS diaktifkan untuk menjalankan Cross-Origin Resource Sharing agar Flutter dapat mengakses data dari project Django. Cookie dan session juga dapat diperoleh melalui CORS sehingga Flutter dapan menyimpan cookie dan session yang sudah ada. Agar bisa menerima/megirim request dari flutter, pengaturan SameSite harus diatur agar bisa menerima cookie dari cross-origin. 
   - Menambahkan akses internet di Android agar Android bisa mengirim dan menerima request melalui jaringan internet.
   - Jika hal ini tidak dikonfigurasi dengan benar, maka bisa saja CORS tidak berjalan dengan baik, Django menolak request dari Flutter, dan Cookie & session tidak akan sesuai pada Django dan flutter.
5. Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.
   - User mengisi form pada dan Flutter melakukan postJson untuk input yang dimasukkan oleh user.
   - Django menerima postJson yang dikirim oleh flutter dan menggunakan function views yang sesuai. Data pun disimpan dalam database.
   - Function views pada Django pun akan mengirim balik JsonResponse yang akan diterima oleh Flutter. 
   - Flutter menerima JsonResponse dan memasukkannya pada custom class (model yang dibuat pada project ini), lalu menampilkannnya kepada user.  
6.  Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.
   - User mengisi form Registrasi dan Flutter melakukan postJson registrasi untuk input yang dimasukkan oleh user.
   - Django menerima postJson dan melakukan registrasi User pada views di aplikasi Authentication, lalu mengembalikan JsonResponse ke Flutter.
   - Flutter menerima JsonResponse dan mengarahkan user ke halaman login (jika berhasil).
   - User mengisi form login dan Flutter mengirim request login untuk input yang dimasukkan oleh user.
   - Django menerima request login dan melakukan user authentication melalui views, lalu mengembalikan JsonResponse ke Flutter.
   - Flutter menerima JsonResponse dan user berhasil/gagal login. 
   - Untuk logout, flutter mengirim request logout.
   - Django menerima logout request dari flutter dan menjalankan proses logout melalui views, lalu mengembalikan JsonResponse.
   - Flutter menerima JsonResponse dan User berhasil/gagal logout.
7. Implementasi Checklist:
   - Menerapkan CORS pada project Django dan melakukan konfigurasi pada settings.py project agar flutter diizinkan melakukan koneksi ke project Django. 
   - Membuat aplikasi Authentication pada project Django yang memiliki views untuk meng-handle proses authentication (login, logout, register) untuk Flutter. 
   - Melakukan integrasi sistem autentikasi pada flutter, yaitu dengan menggunakan package authentication dari PBP. Agar dapat digunakan, maka harus menyediakan CookieRequest ke semua komponen flutter dengan Provider. Provider disini berguna untuk membagikan instance CookieRequest ke semua komponen (widget) Flutter. 
   - Membuat halaman login yang mengirim request login ke Django dan menerima JsonResponse dari Django. Menambahkan text yang bisa ditekan untuk pergi ke halaman register. Lalu membuat main.dart mengarahkan user ke login page terlebih dahulu. Jika sukses login arahkan user ke homepage.
   -  Membuat halaman register yang mengirim postJson ke Django dan menerima JsonResponse dari Django. Jika suskes registrasi, arahkan user ke login page.
   -  Membuat model custom untuk menerima data dari project Django dan ditampilkan di Flutter. Menggunakan Quicktype untuk mengubah Map dari JSON menjadi class yang bisa mengambil data dari JSON.
   -  Terapkan internet permission untuk android pada android/app/src/main/AndroidManifest.xml agar flutter bisa mengakses internet dan melakukan CORS.
   -  Untuk mengatasi masalah CORS pada image/thumbnail, maka dibuat sebuah function baru pada views aplikasi main Django untuk mengambil image dari sumber eksternal dan me-returnnya dengan HttpResponse berisi imagenya agar bisa ditampilkan pada Flutter. 
   -  Untuk menampilkan product, dibuat file dart baru yaitu product_entry_card.dart sebagai widget untuk card-card product yang ingin ditampilkan berdasarkan data dari project Django. Product card akan menampilkan data berdasarkan model custom yang sudah dibuat dan akan mnejadi semirip mungkin dengan yang ada pada project Django. 
   -  Selanjutnya, dibuat file product_entry_list.dart sebagai widget untuk menampung semua product entry yang ada dan menampilkannya. 
   -  Membuat navigasi pada tombol di product_card.dart untuk pergi ke ProductEntryListPage untuk melihat semua product.
   -  Untuk product details, dibuat sebuah file product_details.dart sebagai halaman product detail yang menampilkan details dari product tersebut. 
   -  Mengubah product_entry_list.dart untuk menambahkan navigasi ke halaman product detail saat di-tap/click oleh user pada product cardnya.
   -  Untuk menerima create product dari flutter, maka harus dibuat function baru pada views aplikasi main Django untuk menerima input user dari flutter. Maka, ditambahkan function create_news_flutter untuk men-sanitize input user dan membuatnya sebagai instance product baru agar disimpan dalam databse project Django. 
   -  Lalu dalam productlist_form.dart dihubungkan dengan CookieRequest dengan final request = context.watch<CookieRequest>(); dan melakukan pengirim postJson ketika data input user sudah dimasukkan agar bisa diterima oleh views di project Django. Jika product sukses dibuat, maka lakukan navigasi kembali ke homepage.
   -  Membuat logout dengan menambahkan tombol logout pada menu.dart dan membuat spesifikasinya pada news_card.dart. Lalu melakukan penghubungan dengan CookieRequest dengan final request = context.watch<CookieRequest>();. Mengubah OnTap() menjadi async dan mengirimkan request logout ke Django. Jika sukses maka user akan logout.
   -  Menambahkan button pada menu untuk show my products. Dan menambahkan function baru pada product_entry_list untuk menerima parameter dengan filterMy. Button pada product_card memanggil page product_entry_list dengan parameter filterMy=true. Gunakan filterMy untuk menentukan memanggil function fetchProduct() atau fetchMyProduct(). 


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
