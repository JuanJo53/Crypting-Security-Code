import 'dart:ui';

import 'package:flutter/material.dart';

class Color_Palette{
  Color _primaryColor;
  Color _secondColor;
  Color _black;
  Color _white;

  Color_Palette(){
    _primaryColor=Color(0xff172A3A);
    _secondColor=Color(0xff09BC8A);
    _black=Color(0xff000000);
    _white=Color(0xffffffff);
  }
  darkMode(){
    _primaryColor=Color(0xff09BC8A);
    _secondColor=Color(0xff172A3A);
    _black=Color(0xff062441);
    _white=Color(0xffffffff);

  }
  normalMode(){
    _primaryColor=Color(0xff172A3A);
    _secondColor=Color(0xff09BC8A);
    _black=Color(0xff000000);
    _white=Color(0xffffffff);

  }
  Color get primaryColor => _primaryColor;

  Color get secondColor => _secondColor;

  Color get black => _black;

  Color get white => _white;
}