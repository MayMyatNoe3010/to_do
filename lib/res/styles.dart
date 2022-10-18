

import 'package:flutter/material.dart';

class Styles{
  static TextStyle getStringDeco(bool isComplete){
    if(isComplete) {
      return TextStyle(decoration: TextDecoration.lineThrough);
    }else{
      return TextStyle(decoration: TextDecoration.none);
    }
  }

  static OutlineInputBorder getOutlineBorder(Color color){
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: BorderSide(
        color: color,
        width: 2.0,
      ),
    );
  }
}