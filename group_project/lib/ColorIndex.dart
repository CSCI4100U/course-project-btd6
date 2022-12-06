import 'dart:ui';

import 'package:flutter/material.dart';

Color color(int index) {
  Color? c;
  if(index == 0){
    c = Colors.purple;
  }else if(index == 1){
    c = Colors.purpleAccent;
  }else if(index == 2){
  c = Colors.blueAccent;
  }else if(index == 3){
  c = Colors.teal;
  }else if(index == 4){
  c = Colors.greenAccent;
  }else if(index == 5){
  c = Colors.yellowAccent;
  }else if(index == 6){
  c = Colors.orangeAccent;
  }else{
  c = Colors.redAccent;}

  return c;
}