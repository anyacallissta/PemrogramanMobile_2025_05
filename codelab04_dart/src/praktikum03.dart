void main() {
  
// langkah 1
  var gifts = {
    // Key:    Value
    'first': 'partridge',
    'second': 'turtledoves',
    'fifth': 1
  };

  var nobleGases = {
    2: 'helium',
    10: 'neon',
    18: 2,
  };

  print("Langkah 1:");
  print(gifts);
  print(nobleGases);

// langkah 3
  var mhs1 = Map<String, String>();
  gifts['first'] = 'partridge';
  gifts['second'] = 'turtledoves';
  gifts['fifth'] = 'golden rings';

  var mhs2 = Map<int, String>();
  nobleGases[2] = 'helium';
  nobleGases[10] = 'neon';
  nobleGases[18] = 'argon';

  gifts['nama'] = 'Anya Callissta Chriswantari';
  gifts['nim'] = '2341720234';

  nobleGases[20] = 'Anya Callissta Chriswantari';
  nobleGases[21] = '2341720234';

  mhs1['nama'] = 'Anya Callissta Chriswantari';
  mhs1['nim'] = '2341720234';

  mhs2[99] = 'Anya Callissta Chriswantari';
  mhs2[100] = '2341720234';

  print("\nLangkah 3:");
  print(gifts);
  print(nobleGases);
  print(mhs1);
  print(mhs2);
}
