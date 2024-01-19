import 'package:flutter/material.dart';

class Constants {
  //this is for colors
  static var primaryColor = const Color(0xFFe60024);
  static var secondaryColor = const Color(0xFFe1e1e1);
  static var textcolors = const Color(0xFF3a3a3a);
  static var formtextcolor = Color.fromARGB(255, 106, 100, 100);
  static var FormFillColor = const Color(0xFFe1e1e1);
  static var White = const Color(0xFFfffffff);
  static var UnselectedColor = const Color(0xFFf3efff);

  //Linear Gradiant
  static var linearGradient = LinearGradient(colors: [
    Constants.secondaryColor.withOpacity(0),
    Constants.secondaryColor.withOpacity(.20),
    Constants.secondaryColor.withOpacity(.40),
    Constants.secondaryColor.withOpacity(1),
  ], begin: Alignment.topRight);

  //This is for Something, i don't know, you'll figure it out.
  //static var titleOne = "Learn more about plants";
}
