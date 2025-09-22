void main() {
  
// langkah 1
  var halogens = {'fluorine', 'chlorine', 'bromine', 'iodine', 'astatine'};
  print(halogens);

// langkah 3
  // var names1 = <String>{};
  // Set<String> names2 = {}; // This works, too.
  // var names3 = {}; // Creates a map, not a set.

  // print(names1);
  // print(names2);
  // print(names3);

  var names1 = <String>{};
  Set<String> names2 = {}; 

  names1.add("Anya Callissta Chriswantari");
  names1.add("2341720234");

  names2.addAll({
    "Anya Callissta Chriswantari",
    "2341720234"
  });

  print(names1);
  print(names2);
}