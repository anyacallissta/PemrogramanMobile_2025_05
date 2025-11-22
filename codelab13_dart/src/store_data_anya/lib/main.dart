import 'package:flutter/material.dart';
import 'dart:convert';
import './model/pizza.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter JSON Demo by Anya',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String pizzaString = '';
  List<Pizza> myPizzas = [];
  int appCounter = 0;
  String documentsPath = '';
  String tempPath = '';
  late File myFile;
  String fileText = '';
  final pwdController = TextEditingController();
  String myPass = '';
  final storage = const FlutterSecureStorage();
  final myKey = 'myPass';
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      // appBar: AppBar(title: const Text('JSON by Anya'), backgroundColor: Colors.pink[100]),
      // body: ListView.builder(
      //   itemCount: myPizzas.length,
      //   itemBuilder: (context, index) {
      //     return ListTile(
      //       title: Text(myPizzas[index].pizzaName),
      //       subtitle: Text(myPizzas[index].description),
      //       trailing: Text('\$${myPizzas[index].price.toStringAsFixed(2)}'),
      //     );
      //   },
      // )

      // appBar: AppBar(title: Text('Shared Preferences by Anya'), backgroundColor: Colors.pink[100]),
      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //     children: [
      //       Text(
      //         'You have opened this app $appCounter times.',
      //       ),
      //       ElevatedButton(
      //         onPressed: () {
      //           deletePreference();
      //         },
      //         child: const Text('Reset Counter'),
      //       ),
      //     ],
      //   ),
      // ),

      // appBar: AppBar(title: const Text('Path Provider by Anya'), backgroundColor: Colors.pink[100]),
      // body: Padding(
      //   padding: const EdgeInsets.all(16.0),
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //     children: [
      //       Text('Documents Path: $documentsPath'),
      //       Text('Temporary Path: $tempPath'),

      //       ElevatedButton(
      //         child: const Text('Read File'),
      //         onPressed: () => readFile(),
      //       ),
      //       Text(fileText),
      //     ],
      //   ),
      // ),

      appBar: AppBar(title: const Text('Secure Storage by Anya'), backgroundColor: Colors.pink[100]),
      body: Column(
        children: [
          TextField(
            controller: pwdController,
            decoration: const InputDecoration(
              labelText: 'Enter a secret value',
            ),
          ),
          const SizedBox(height: 20),

          ElevatedButton(
            child: const Text('Save Value'), 
            onPressed: () {
              writeToSecureStorage();
          }),
          const SizedBox(height: 20),

          ElevatedButton(
            child: Text('Read Value'),
            onPressed: () {
              readFromSecureStorage().then((value) {
                setState(() {
                  myPass = value;
                });
              });
            }
          ),
          Text('Stored Value: $myPass'),
        ],
      )
    );
  }

  @override
  void initState() {
    super.initState();
    // readJsonFile().then((value) {
    //   setState(() {
    //     myPizzas = value;
    //   });
    // });
    // readAndWritePreferences();
    // getPaths();

    // getPaths().then((_) {
    //   myFile = File('$documentsPath/myfile.txt');
    //   writeFile();
    // });

    readFromSecureStorage().then((value) {
      setState(() {
        myPass = value;
      });
    });
  }

  Future<List<Pizza>> readJsonFile() async {
    String myString = await DefaultAssetBundle.of(context)
      .loadString('assets/pizzalist.json');

    List pizzaMapList = jsonDecode(myString);

    List<Pizza> myPizzas = [];
    for (var pizza in pizzaMapList) {
      Pizza myPizza = Pizza.fromJson(pizza);
      myPizzas.add(myPizza);
    }

    // setState(() {
    //   pizzaString = myString;
    // });

    String json = convertToJSON(myPizzas);
    print(json);

    return myPizzas;
  }

  String convertToJSON(List<Pizza> pizzas) {
    return jsonEncode(pizzas.map((pizza) => pizza.toJson()).toList());
  }  

  Future readAndWritePreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    appCounter = prefs.getInt('appCounter') ?? 0;
    appCounter++;
    await prefs.setInt('appCounter', appCounter);

    setState(() {
      appCounter = appCounter;
    });
  }

  Future deletePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();

    setState(() {
      appCounter = 0;
    });
  }

  Future getPaths() async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final tempDirectory = await getTemporaryDirectory();

    setState(() {
      documentsPath = documentsDirectory.path;
      tempPath = tempDirectory.path;
    });
  }

  Future<bool> writeFile() async {
    try {
      await myFile.writeAsString('Margherita, Capricciosa, Napoli');
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> readFile() async {
    try {
      String contents = await myFile.readAsString();
      setState(() {
        fileText = contents;
      });
      return true;
    } catch (e) {
      return false;
    }
  }

  Future writeToSecureStorage() async {
    await storage.write(key: myKey, value: pwdController.text);
  }

  Future<String> readFromSecureStorage() async {
    String secret = await storage.read(key: myKey) ?? '';
    return secret;
  }
}