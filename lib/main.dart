import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:crypting_security_app/colors.dart';
import 'package:flutter/material.dart';

import 'Pages/Caesar_Page.dart';

void main() => runApp(MyApp());


class MyApp extends StatefulWidget {
  Color_Palette _colores;
  MyApp(){
    _colores=Color_Palette();
  }

  Color_Palette get colores => _colores;

  @override
  _MyAppState createState() => _MyAppState(_colores);
}

class _MyAppState extends State<MyApp> {
  Color_Palette _colores;
  _MyAppState(this._colores);

  int _currentIndex = 0;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Encriptacion"),backgroundColor: _colores.primaryColor,),
        body: SizedBox.expand(
          child: PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() => _currentIndex = index);
            },
            children: <Widget>[
              Caesar_Page(_colores),
              Caesar_Page(_colores),
              Caesar_Page(_colores),
              Caesar_Page(_colores),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavyBar(
          selectedIndex: _currentIndex,
          onItemSelected: (index) {
            setState(() => _currentIndex = index);
            _pageController.jumpToPage(index);
          },
          items: <BottomNavyBarItem>[
            BottomNavyBarItem(
                title: Text('Item One'),
                icon: Icon(Icons.home),
                activeColor: _colores.primaryColor
            ),
            BottomNavyBarItem(
                title: Text('Item Two'),
                icon: Icon(Icons.apps),
                activeColor: _colores.primaryColor
            ),
            BottomNavyBarItem(
                title: Text('Item Three'),
                icon: Icon(Icons.chat_bubble),
                activeColor: _colores.primaryColor
            ),
            BottomNavyBarItem(
                title: Text('Item Four'),
                icon: Icon(Icons.settings),
                activeColor: _colores.primaryColor
            ),
          ],
        ),
      ),
    );
  }

}

