Nama : Anya Callissta Chriswantari
<br>NIM : 2341720234
<br>Kelas : TI 3G
<br>Absen : 05

---

# PEMROGRAMAN MOBILE - PERTEMUAN 13

## Praktikum 1 - Konversi Dart Model ke JSON
### Soal 1
Tambahkan nama panggilan Anda pada title app sebagai identitas hasil pekerjaan Anda.<br>
![Output Praktikum 1 Soal 1](img/P1_S2.png)

_Gambar 1. Ouput Praktikum 1 Soal 1_

### Soal 2
![Output Praktikum 1 Soal 2](img/P1_S2.png)

_Gambar 2. Ouput Praktikum 1 Soal 2_

### Soal 3
![Output Praktikum 1 Soal 3](img/P1_S3.png)

_Gambar 3. Ouput Praktikum 1 Soal 3_

## Praktikum 2 - Handle Kompatibilitas Data JSON
### Soal 4
![Output Praktikum 2 Soal 4](img/P2_S4.png)

_Gambar 4. Ouput Praktikum 2 Soal 4_

## Praktikum 3 - Menangani Error JSON
### Soal 5
![Output Praktikum 3 Soal 5](img/P2_S4.png)

_Gambar 5. Ouput Praktikum 3 Soal 5_

Jelaskan maksud kode lebih safe dan maintainable!
>Jawab: Menggunakan konstanta untuk key JSON membuat kode lebih aman dan mudah dirawat karena dapat mencegah kesalahan penulisan yang sulit dideteksi saat menggunakan string literal langsung, sebab setiap kesalahan penulisan key akan langsung terdeteksi oleh compiler. Selain itu, perubahan nama key di backend menjadi jauh lebih mudah karena cukup mengubah satu nilai konstanta tanpa perlu mencari dan mengganti banyak string yang tersebar di berbagai file. Praktik ini juga menghindari penggunaan magic strings yang tidak terorganisir, sehingga kode menjadi lebih konsisten, bersih, dan mudah dikelola terutama pada proyek besar atau dikerjakan oleh banyak developer.

## Praktikum 4 - Shared Preferences
### Soal 6
![Output Praktikum 4 Soal 6](img/P4_S6.gif)

_Gambar 6. Ouput Praktikum 4 Soal 6_

## Praktikum 5 - Akses File System dengan path_provider
### Soal 7
![Output Praktikum 5 Soal 7](img/P5_S7.png)

_Gambar 7. Ouput Praktikum 5 Soal 7_

## Praktikum 6 - Akses File System dengan Direktori
### Soal 8
![Output Praktikum 6 Soal 8](img/P6_S8.gif)

_Gambar 8. Ouput Praktikum 6 Soal 8_

Jelaskan maksud kode pada langkah 3 dan 7!
>Jawab: Pada langkah 3 dibuat fungsi bertipe boolean untuk menulis teks ke dalam file, jika true akan mengembalikan teks yang berisi nama dan nim, jika false gagal menulis teks. <br>Pada langkah 7 dilakukan klik button "Read File" yang nantinya akan memanggil method readFile() untuk mengembalikan teks yang sudah dibuat di langlah 3.

## Praktikum 7 - Menyimpan Data dengan Enkripsi/Dekripsi
### Soal 9
![Output Praktikum 7 Soal 9](img/P7_S9.gif)

_Gambar 9. Ouput Praktikum 7 Soal 9_