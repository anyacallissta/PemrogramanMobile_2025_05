void main() {

// Langkah 1
  var record = ('first', a: 2, b: true, 'last');
  print("Langkah 1:");
  print(record);

// Langkah 3
  (int, int) tukar((int, int) record) {
    var (a, b) = record;
    return (b, a);
  }

  var record2 = tukar((1, 2));
  print(record2);
  
// // Langkah 4
//   // Record type annotation in a variable declaration:
//   (String, int) mahasiswa = ('Anya Callissta Chriswantari', 2341720234);
//   print("\nLangkah 4:");
//   print(mahasiswa);

// // Langkah 5
//   var mahasiswa2 = ('first', a: 'Anya Callissta Chriswantari (2341720234)', b: true, 'last');

//   print("\nLangkah 5:");
//   print(mahasiswa2.$1); // Prints 'first'
//   print(mahasiswa2.a); // Prints 2
//   print(mahasiswa2.b); // Prints true
//   print(mahasiswa2.$2); // Prints 'last'
}