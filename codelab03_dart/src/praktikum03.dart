void main() {
// langkah 1
  print("Output langkah 1:");
  var index;
  for (index = 10; index < 27; index++) {
    print(index);
  }

// langkah 3
  print("\nOutput langkah 3:");
  for (index = 10; index < 27; index++) {
    if (index == 21) break;
    else if (index > 1 && index < 7) continue;
    print(index);
  }
}