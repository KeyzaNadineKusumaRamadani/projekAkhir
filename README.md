📱 Fruit Store App
Aplikasi Flutter untuk menampilkan data buah, berita, dan akun pengguna. Aplikasi ini menggunakan struktur MVC sederhana (Model – Controller – View) agar kode rapi, modular, dan mudah dikembangkan.

<img width="619" height="898" alt="Screenshot 2025-11-18 132925" src="https://github.com/user-attachments/assets/c0968ffb-2992-4a5a-ae2d-6139b4d8f2b9" />
merupakan halaman splash screen dari aplikasi fruitstore

<img width="621" height="902" alt="Screenshot 2025-11-18 132914" src="https://github.com/user-attachments/assets/79310a51-91cf-4aee-8d51-d04ecb7c6c69" />
merupakan halam dashboard dari fruit store

<img width="623" height="896" alt="Screenshot 2025-11-18 132937" src="https://github.com/user-attachments/assets/370d8194-d08c-44b2-9eac-6d563bc2c0b8" />
halaman tersebut merupakan halamn untuk menambah jualan buah yang baru 

<img width="625" height="895" alt="Screenshot 2025-11-18 132948" src="https://github.com/user-attachments/assets/bd7e3c8a-63bb-430f-8da3-e8f545afbef9" />
halaman tersebut merupakan halaman saat user memilih buat yang akan dibelinya ada penjelasan atau deskripsi tentang buahnya harga dll

<img width="622" height="905" alt="Screenshot 2025-11-18 133112" src="https://github.com/user-attachments/assets/52359231-90e0-44ed-8f61-54c243a4e69a" />
merupakan halaman berita/news yakni berisi tentang berbagai macam berita tentang buah 

<img width="617" height="906" alt="Screenshot 2025-11-18 133347" src="https://github.com/user-attachments/assets/4ef1daa3-9f0f-44bc-a9d2-ede58bf6172a" />
merupakan halaman akun/user berisi keterangan tang user atau owner dari fruite store

🥭 Deskripsi Singkat
Aplikasi Fruit Store terdiri dari tiga halaman utama. Halaman pertama adalah halaman buah yang menampilkan daftar buah dalam bentuk grid. Setiap buah memiliki tampilan berupa gambar, nama, harga, dan warna kartu yang berbeda. Ketika sebuah buah ditekan, aplikasi akan menampilkan tampilan bottom sheet berisi gambar berukuran lebih besar, nama buah, deskripsi, serta tombol untuk menambah atau mengurangi jumlah pembelian. Total harga akan dihitung secara otomatis sesuai jumlah yang dipilih. Pada halaman ini juga sudah tersedia fitur CRUD sehingga pengguna dapat menambah buah baru, mengedit buah yang sudah ada, atau menghapus buah berdasarkan ID tertentu. Seluruh proses tersebut diatur oleh controller dan model yang dibuat secara terpisah agar kode lebih rapi.

Halaman kedua adalah halaman berita yang berisi daftar informasi atau artikel singkat tentang buah. Setiap berita memiliki gambar, judul, deskripsi singkat, dan tanggal. Data berita ditampilkan menggunakan ListView dan komponen UI yang digunakan memiliki widget khusus agar tampilannya konsisten dan mudah digunakan kembali. Seluruh data berita dikelola oleh controller yang menyediakan data kepada halaman view.

Halaman ketiga adalah halaman akun yang menampilkan data profil pengguna seperti nama lengkap, email, username, nomor telepon, alamat, tanggal lahir, role pengguna, serta status akun. Seluruh informasi ditampilkan menggunakan tampilan ListTile agar terlihat rapi dan mudah dibaca. Data akun ini dikelola melalui model dan controller yang berada dalam folder tersendiri.

Struktur Folder Project
Struktur folder aplikasi dibuat agar setiap bagian kode memiliki tempatnya sendiri. Pada folder models terdapat file yang berisi struktur data untuk buah, berita, dan user. Pada folder controllers terdapat file yang bertugas mengelola data tersebut, termasuk mengambil data, menambah, memperbarui, dan menghapusnya. Folder views berisi file tampilan untuk setiap halaman utama seperti halaman buah, halaman berita, dan halaman akun. Selain itu terdapat folder widget yang berisi komponen UI khusus seperti widget berita yang digunakan untuk menampilkan item berita secara konsisten.



