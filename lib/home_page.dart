import 'package:flutter/material.dart';
import 'package:untitled/xo.dart';

class HomePage extends StatelessWidget{
  static const String routeName='HomePage';
  var player1name='';
  var player2name='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to XO Game '),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
            child: TextField(
              onChanged: (text) => player1name=text,
              decoration:
              InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(width: 2,color: Colors.blue)),
                hintText: 'player1name'

              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
            child: TextField(
              onChanged: (text) => player2name=text,
              decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(width: 2,color: Colors.blue)),
                  hintText: 'player2name',

              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
            child: ElevatedButton(onPressed: (){
              Navigator.pushNamed(context, XoApp.routeName,
              arguments: GameBordArgs(player1name: player1name, player2name: player2name)
              );

            },
                child: Text('Let’s play')),
          )
        ],
      ),

    );
  }

}