import 'package:flutter/material.dart';
import 'package:untitled/contacts%20_screen.dart';
import 'package:untitled/home_page.dart';
import 'package:untitled/xo.dart';


void main(){

  runApp(App());

}

class App extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
       routes: {
        XoApp.routeName:(context) => XoApp(),
         HomePage.routeName:(context) => HomePage()
       },

      initialRoute: HomePage.routeName


    );
  }

}