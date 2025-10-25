Nama : Anya Callissta Chriswantari
<br>NIM : 2341720234
<br>Kelas : TI 3G
<br>Absen : 05

---

# PEMROGRAMAN MOBILE - PERTEMUAN 9

## Praktikum 1
![Output Praktikum 1](img/P1(1).jpg)
![Output Praktikum 1](img/P1(2).jpg)

_Gambar 1. Ouput Praktikum 1_

## Praktikum 2
![Output Praktikum 2](img/P2.gif)

_Gambar 2. Ouput Praktikum 2_

## Tugas Praktikum
![Output Tugas Praktikum](img/Tugas.gif)

_Gambar 3. Ouput Tugas Praktikum_
3. Jelaskan maksud void async pada praktikum 1?
>Jawab: <br>async menandakan bahwa fungsi ini asynchronous, artinya di dalam fungsi bisa menggunakan await untuk menunggu proses yang membutuhkan waktu. void menandakan fungsi tidak mengembalikan nilai. void async berarti fungsi ini tidak mengembalikan nilai, tapi bersifat asynchronous, sehingga bisa menggunakan await di dalamnya untuk menunggu proses lain selesai.

4. Jelaskan fungsi dari anotasi @immutable dan @override ?
>Jawab: <br>a. @immutable: Digunakan pada kelas (class) untuk menandakan bahwa semua field/variabel harus final. Artinya objek tidak boleh diubah setelah dibuat. Biasanya digunakan untuk Widget Stateless di Flutter agar tidak memiliki state internal yang berubah, sehingga lebih aman dan predictable. <br>b. @override: Digunakan ketika kita menimpa (override) metode dari kelas induk. Memberi tahu kompiler dan pembaca kode bahwa fungsi ini berasal dari superclass atau interface, dan kita membuat implementasi khusus. Membantu menghindari typo atau kesalahan penamaan metode.
