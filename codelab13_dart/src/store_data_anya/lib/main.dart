import 'package:flutter/material.dart';
import 'dart:convert';
import './model/pizza.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

      appBar: AppBar(title: Text('Shared Preferences by Anya'), backgroundColor: Colors.pink[100]),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'You have opened this app $appCounter times.',
            ),
            ElevatedButton(
              onPressed: () {
                deletePreference();
              },
              child: const Text('Reset Counter'),
            ),
          ],
        ),
      ),
    );
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

  @override
  void initState() {
    super.initState();
    // readJsonFile().then((value) {
    //   setState(() {
    //     myPizzas = value;
    //   });
    // });
    readAndWritePreferences();
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
}