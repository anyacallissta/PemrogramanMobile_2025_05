void main() {
  String nama = "Anya Callissta Chriswantari"; 
  String nim = "2341720234";

  for (int i = 0; i <= 201; i++) {
    if (isPrima(i)) {
      print("Bilangan Prima: $i -> $nama | $nim");
    }
  }
}

bool isPrima(int n) {
  if (n < 2) return false;
  for (int i = 2; i <= n ~/ 2; i++) {
    if (n % i == 0) {
      return false;
    }
  }
  return true;
}
