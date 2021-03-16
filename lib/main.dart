/// Flutter code sample for TabBar

// This sample shows the implementation of [TabBar] and [TabBarView] using a [DefaultTabController].
// Each [Tab] corresponds to a child of the [TabBarView] in the order they are written.

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

/// This is the main application widget.
class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyStatelessWidget(),
    );
  }
}

/// This is the stateless widget that the main application instantiates.
class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Crypting Algorithms'),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                text: "Vigenere",
                icon: Icon(Icons.blur_linear),
              ),
              Tab(
                text: "Caesar",
                icon: Icon(Icons.line_style),
              ),
              Tab(
                text: "Cipher Disk",
                icon: Icon(Icons.panorama_fish_eye),
              ),
              Tab(
                text: "Enigma Machine",
                icon: Icon(Icons.keyboard),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            Center(
              child: Text('Aqui el vigenere'),
            ),
            Center(
              child: Text('Aqui el cesare'),
            ),
            Center(
              child: Text('Aqui el de disco de cifrado'),
            ),
            Center(
              child: Text('Aqui la maquina de enigma'),
            ),
          ],
        ),
      ),
    );
  }
}
