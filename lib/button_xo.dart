import 'package:flutter/material.dart';

class ButtonXo extends StatelessWidget{
  var text;
  var index;
  Function onButtonClicked;
  ButtonXo({required this.text,required this.onButtonClicked,required this.index});
  @override
  Widget build(BuildContext context) {
    return Expanded(child: ElevatedButton(onPressed: () {
      onButtonClicked(index);
    }, child: Text(text,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),));
  }

}