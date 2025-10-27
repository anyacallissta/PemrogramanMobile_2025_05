Nama : Anya Callissta Chriswantari
<br>NIM : 2341720234
<br>Kelas : TI 3G
<br>Absen : 05

---

# PEMROGRAMAN MOBILE - PERTEMUAN 2

## Soal 1
![Output Soal 1](img/P2.png)

_Gambar 1. Ouput Soal 1_

## Soal 2
Mengapa sangat penting untuk memahami bahasa pemrograman Dart sebelum kita menggunakan framework Flutter ? Jelaskan!
> Jawab: Flutter adalah framework UI yang digunakan untuk membangun aplikasi mobile, web, dan dekstop. Bahasa pemrograman yang digunakan adalah Dart, sehingga sangat penting untuk memahami bahasa pemrograman Dart, karena jika tidak memahami Dart akan kesulitan saat mengelola variabel dan tipe data, menerapkan OOP, dan menangani asynchronus.

## Soal 3
Rangkumlah materi dari codelab ini menjadi poin-poin penting yang dapat Anda gunakan untuk membantu proses pengembangan aplikasi mobile menggunakan framework Flutter.
> Jawab: 
- Dart dirancang untuk objek oriented yang memiliki fitur encapsulation, inherintance, composition, abstraction, dan polymorphism. 
- Dalam dart terdapat arithmetic operators, increment and decrement operators, equality and relational operator, dan logical operators.
- Dart menggunakan function dan method untuk memisahkan kode seperti menerima data, mengeksekusi kode, dan mengembalikan data. Tiap aplikasi dart harus memiliki function main karena function main digunakan untuk mengeksekusi kode.
- Perbedaan function dan method yaitu: function berada di luar class sedangkan method terikat pada turunan class dan memiliki referensi secara implisit ke instance class melalui keyword this.

## Soal 4
Buatlah penjelasan dan contoh eksekusi kode tentang perbedaan Null Safety dan Late Variabel !
> Jawab: Null Safety digunakan untuk memastikan variabel tidak bisa bernilai null kecuali dideklarasikan secara eksplisit. Sedangkan Late Variable digunakan untuk mendeklarasikan variabel tanpa langsung memberikan nilai awal, tapi akan diinisialisasi sebelum variabel tersebut digunakan. Secara singkatt Null Safety untuk menentukan apakah variabel bisa bernilai null sedangkan Late Variabel digunakan untuk menunda inisialisasi variabel.

```dart
void main() {
// null safety
  String? alamat;
  alamat = null;
  print("Contoh Null Safety");
  print("Alamat: $alamat");

// late variable
  late String name;
  name = "Anya Callissta";
  print("\nContoh Late Variable");
  print("Nama: $name");
}
```

![Output Soal 4](img/P2_S4.png)

_Gambar 2. Output Soal 4_