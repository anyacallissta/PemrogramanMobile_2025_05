import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Namer App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();

// Your first behavior
  void getNext() {
    current = WordPair.random();
    notifyListeners();
  }

// step 6 add the business logic
  var favorites = <WordPair>[];

  void toggleFavorite() {
    if (favorites.contains(current)) {
      favorites.remove(current);
    } else {
      favorites.add(current);
    }
    notifyListeners();
  }
}

// class MyHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     var appState = context.watch<MyAppState>();
//     var pair = appState.current; // step 5 extract widget
//     // return Scaffold(
//     //   body: Column(
//     //     children: [
//     //       Text('A random idea:'),
//     //       Text(appState.current.asLowerCase),
//     //     ],
//     //   ),
//     // );

//     // step 6 add button
//     IconData icon;
//     if (appState.favorites.contains(pair)) {
//       icon = Icons.favorite;
//     } else {
//       icon = Icons.favorite_border;
//     }

// // step 4
// // First Hot Reload
//     // return Scaffold(
//     //   body: Column(
//     //     children: [
//     //       Text('A random AWESOME idea:'),  // ← Example change.
//     //       Text(appState.current.asLowerCase),
//     //     ],
//     //   ),
//     // );

// // Adding a button
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,  // step 5 center ui
//           children: [
//             // Text('A random AWESOME idea:'),
//             // Text(appState.current.asLowerCase),
//             BigCard(pair: pair), // step 5 extract widget
//             SizedBox(height: 10),
        
//             // ↓ Add this.
//             Row(
//               mainAxisSize: MainAxisSize.min,   // step 6 add button
//               children: [

//                 // step 6 add button
//                 ElevatedButton.icon(
//                   onPressed: () {
//                     appState.toggleFavorite();
//                   },
//                   icon: Icon(icon),
//                   label: Text('Like'),
//                 ),
//                 SizedBox(width: 10),

//                 ElevatedButton(
//                   onPressed: () {
//                     // print('button pressed!');
//                     appState.getNext(); // call getNext method
//                   },
//                   child: Text('Next'),
//                 ),
//               ],
//             ),
        
//           ],
//         ),
//       ),
//     );
//   }
// }

// step 7 add sidebar
// ...

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 0;     // setState.

  @override
  Widget build(BuildContext context) {
    // ...
    // selected index
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = GeneratorPage();
        break;
      case 1:
        page = FavoritesPage();
        break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    // ...
    return LayoutBuilder(
      builder: (context, constraints) { // Responsiveness
        return Scaffold(
          body: Row(
            children: [
              SafeArea(
                child: NavigationRail(
                  // extended: true,
                  extended: constraints.maxWidth >= 600,  // Responsiveness.
                  destinations: [
                    NavigationRailDestination(
                      icon: Icon(Icons.home),
                      label: Text('Home'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.favorite),
                      label: Text('Favorites'),
                    ),
                  ],
                  // selectedIndex: 0,
                  // onDestinationSelected: (value) {
                  //   print('selected: $value');
                  // },
        
                  // setState
                  selectedIndex: selectedIndex,  
                  onDestinationSelected: (value) {
                    setState(() {
                      selectedIndex = value;
                    });
                  },
        
                ),
              ),
              Expanded(
                child: Container(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  // child: GeneratorPage(),
                  child: page,  // selected index
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}

class GeneratorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var pair = appState.current;

    IconData icon;
    if (appState.favorites.contains(pair)) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BigCard(pair: pair),
          SizedBox(height: 10),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  appState.toggleFavorite();
                },
                icon: Icon(icon),
                label: Text('Like'),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  appState.getNext();
                },
                child: Text('Next'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ...

class BigCard extends StatelessWidget {
  const BigCard({
    super.key,
    required this.pair,
  });

  final WordPair pair;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);       // step 5 theme and style
    final style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary, // step 5 text theme
    );

    return Card(
      color: theme.colorScheme.primary,    // step 5 theme and style
      child: Padding(
        padding: const EdgeInsets.all(20),
        // child: Text(pair.asLowerCase),
        // child: Text(pair.asLowerCase, style: style), // step 5 text theme
        child: Text( // step 5 improve accessibility
          pair.asLowerCase,
          style: style,
          semanticsLabel: "${pair.first} ${pair.second}",
        ),
      ),
    );
  }
}

// ...
// step 8
class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    if (appState.favorites.isEmpty) {
      return Center(
        child: Text('No favorites yet.'),
      );
    }

    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text('You have '
              '${appState.favorites.length} favorites:'),
        ),
        for (var pair in appState.favorites)
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text(pair.asLowerCase),
          ),
      ],
    );
  }
}