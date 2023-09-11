import 'package:flutter/material.dart';

class VisibilityClass extends StatefulWidget{
  var isVisible;
  var name;
  var phone;
  VisibilityClass({required this.isVisible, required this.name,required this.phone});

  @override
  State<VisibilityClass> createState() => _VisibilityClassState();
}

class _VisibilityClassState extends State<VisibilityClass> {
  @override
  Widget build(BuildContext context) {
    return  Visibility(

      visible:widget.isVisible,

      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(25),color: Colors.blue),

        margin: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
        padding: EdgeInsets.symmetric(vertical: 25,horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Name: ${widget.name} ",style: TextStyle(fontSize: 15),),
                SizedBox(height: 8,),
                Text("Phone: ${widget.phone}",style: TextStyle(fontSize: 15)),
              ],
            ),
            IconButton(onPressed: (){
              setState(() {

                widget.isVisible = false;
              });

            }, icon:Icon(Icons.delete,color: Colors.red),)

          ],
        ),
      ),
    );
  }
}
