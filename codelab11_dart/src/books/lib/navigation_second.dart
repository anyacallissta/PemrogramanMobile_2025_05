import 'package:flutter/material.dart';

class NavigationSecond extends StatefulWidget {
  const NavigationSecond({super.key});

  @override
  State<NavigationSecond> createState() => _NavigationSecondState();
}

class _NavigationSecondState extends State<NavigationSecond> {
  @override
  Widget build(BuildContext context) {
    Color color;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigation Second Screen by Anya'),
        backgroundColor: const Color.fromARGB(255, 193, 164, 206),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              child: const Text('Magenta'),
              onPressed: () {
                color = const Color.fromARGB(255, 180, 54, 161);
                Navigator.pop(context, color);
              },
            ),
            ElevatedButton(
              child: const Text('Dark Orange'),
              onPressed: () {
                color = const Color.fromARGB(255, 148, 107, 62);
                Navigator.pop(context, color);
              },
            ),
            ElevatedButton(
              child: const Text('Dark Cyan'),
              onPressed: () {
                color = const Color.fromARGB(255, 73, 120, 133);
                Navigator.pop(context, color);
              },
            ),
          ],
        ),
      ),
    );
  }
}