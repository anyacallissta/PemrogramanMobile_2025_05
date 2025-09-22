void main() {

// // langkah 1
//   var list = [1, 2, 3];
//   var list2 = [0, ...list];
//   print("Langkah 1:");
//   print(list);
//   print(list2);
//   print(list2.length);

// // langkah 3
//   print("\nLangkah 3:");
//   var list1 = [1, 2, null];
//   print(list1);
//   var list3 = [0, ...?list1];
//   print(list3.length);

// // Langkah 4
//   print("\nLangkah 4 (false):");
//   bool promoActive = false;
//   var nav = ['Home', 'Furniture', 'Plants', if (promoActive) 'Outlet'];
//   print(nav);

// // Langkah 5
//   print("\nLangkah 5 (login bernilai Admin):");
//   String login = 'Admin';
//   var nav2 = ['Home', 'Furniture', 'Plants', if (login case 'Manager') 'Inventory'];
//   print(nav2);

// Langkah 6
  print("\nLangkah 6:");
  var listOfInts = [1, 2, 3];
  var listOfStrings = ['#0', for (var i in listOfInts) '#$i'];
  assert(listOfStrings[1] == '#1');
  print(listOfStrings);
  }