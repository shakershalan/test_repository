import 'package:flutter/material.dart';
import 'button_xo.dart';

class XoApp extends StatefulWidget{
  static const String routeName='xoGame';
  @override
  State<XoApp> createState() => _XoAppState();
}

class _XoAppState extends State<XoApp> {

  List<String> textList =[
    '','','',
    '','','',
    '','','',
  ];

  int player1score=0;
  int player2score=0;

  @override
  Widget build(BuildContext context) {
    GameBordArgs args = ModalRoute.of(context)?.settings.arguments as GameBordArgs;

    return Scaffold(
      appBar: AppBar(title:
        const Text("XO Game"),
        centerTitle: true,

      ),

      body:  Column(
        children: [
           Expanded(
              child:
          Row(

            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Text(args.player1name
                  ,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  SizedBox(height: 4,),
                  Text('$player1score',style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Text(args.player2name,style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                  SizedBox(height: 4,),
                  Text('$player2score',style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
              ],)
            ],
          )),
          Expanded(
              child:Row(
                crossAxisAlignment:  CrossAxisAlignment.stretch,

                children: [
                  ButtonXo(text: textList[0],onButtonClicked: onButtonClicked,index: 0,),
                  ButtonXo(text:textList[1] ,onButtonClicked:onButtonClicked ,index: 1,),
                  ButtonXo(text: textList[2],onButtonClicked: onButtonClicked,index: 2,),

                ],
              ) ),
          Expanded(
              child:Row(
                crossAxisAlignment:  CrossAxisAlignment.stretch,

                children: [
                  ButtonXo(text:textList[3] ,onButtonClicked:onButtonClicked ,index: 3,),
                  ButtonXo(text:textList[4],onButtonClicked:onButtonClicked ,index: 4,),
                  ButtonXo(text:textList[5] ,onButtonClicked: onButtonClicked,index: 5,),

                ],
              ) ),
          Expanded(
              child:Row(
                crossAxisAlignment:  CrossAxisAlignment.stretch,

                children: [
                  ButtonXo(text:textList[6] ,onButtonClicked:onButtonClicked ,index: 6,),
                  ButtonXo(text:textList[7] ,onButtonClicked:onButtonClicked ,index: 7,),
                  ButtonXo(text:textList[8] ,onButtonClicked:onButtonClicked ,index: 8,),

                ],
              ) ),
        ],
      ),
    );
  }
  var counter = 0;

  void onButtonClicked(var index){
    if(textList[index].isNotEmpty){
      return;
    }
         if(counter %2 ==0){
           textList[index] = 'x';
         }
         else{
           textList[index]='o';
         }
         counter++;
         if(chickWinner('x')){
           player1score ++;
           initBord();

         }
         else if(chickWinner('o')){
           player2score++;
           initBord();
         }
         else if(counter==9){
           initBord();
         }
         setState(() {

         });
  }
  bool chickWinner(var symbol){
    for(int i=0;i<9;i+=3){
      if(textList[i]==symbol && textList[i+1]==symbol && textList[i+2]==symbol){
        return true;
      }
    }
    for(int i=0;i<3;i++){
      if(textList[i]==symbol && textList[i+3]==symbol && textList[i+6]==symbol){
        return true;
      }
    }
    if(textList[0]==symbol && textList[4]==symbol && textList[8]==symbol){
      return true;
    }
    if(textList[2]==symbol && textList[4]==symbol && textList[6]==symbol){
      return true;
    }
    return false;

  }
  void initBord(){
    textList =[
      '','','',
      '','','',
      '','','',
    ];
    counter=0;
  }
}
class GameBordArgs{
    String player1name;
    String player2name;
    GameBordArgs({required this.player1name, required this.player2name});

}