import 'package:flutter/material.dart';
import 'package:untitled/visibility_class.dart';

class ContactsScreen extends StatefulWidget{

  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
  void clearText(){

  }
}

class _ContactsScreenState extends State<ContactsScreen> {
  bool isVisible1=false;
  bool isVisible2= false;
  bool isVisible3=false;
  String name1 = '';
  String name2 = '';
  String name3 = '';
  String phone1 = '';
  String phone2 = '';
  String phone3 = '';
  GlobalKey<FormState> formState = GlobalKey();
  final textFiled1= TextEditingController();
  final textFiled2= TextEditingController();


  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('Contacts Screen'),
      centerTitle: true,
    ),
    body: SingleChildScrollView(

      child: Form(
        key: formState,
        child: Column(
           crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              child:TextFormField(
                controller: textFiled1,
                validator: (value) {
                  if(value!.isEmpty){
                    return "name cant be empty";
                  }
                },
                onChanged: (value){
                  if(isVisible1==false && isVisible2 == false && isVisible3 == false ){
                    setState(() {
                      name1 = value;
                    });
                  }
                  if(isVisible1==true && isVisible2 == false  && isVisible3 == false ){
                    setState(() {
                      name2 = value;
                    });
                  }
                  if(isVisible1==true && isVisible2 == true && isVisible3 == false ){
                    setState(() {
                      name3 = value;
                    });
                  }

                },
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "Enter Your Name Here",
                    suffixIcon:Icon(Icons.edit,color: Color(-14575885),),
                    border:
                    OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.blue,width: 2),

                    )
                ),
              ) ,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              child:TextFormField(
                controller: textFiled2,
                validator: (value) {
                  if(value!.isEmpty){
                    return "phone number cant be empty";
                  }
                },
                onChanged: (value){
                  if(isVisible1==false && isVisible2 == false && isVisible3 == false ){
                    setState(() {
                      phone1= value;
                    });
                  }
                  if(isVisible1==true && isVisible2 == false  && isVisible3 == false ){
                    setState(() {
                      phone2 = value;

                    });
                  }
                  if(isVisible1==true && isVisible2 == true && isVisible3 == false ){
                    setState(() {
                      phone3 = value;
                    });
                  }
                },
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "Enter Your Number Here",
                    suffixIcon:Icon(Icons.call,color: Color(-14575885),),
                    border:
                    OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.blue,width: 2),

                    )
                ),


              ) ,
            ),


            Row(
              children: [
                Expanded(
                  child: Container(

                    margin: EdgeInsets.symmetric(horizontal: 5),
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: ElevatedButton(onPressed: (){

                      if(formState.currentState!.validate()){
                        if(isVisible1==false && isVisible2==false &&isVisible3==false){

                          setState(() {
                            textFiled1.clear();
                            textFiled2.clear();
                            isVisible1=true;


                          });
                        }
                        else if(isVisible1==true && isVisible2==false &&isVisible3==false){
                          setState(() {
                            textFiled1.clear();
                            textFiled2.clear();
                            isVisible2=true;

                          });
                        }
                        else if(isVisible2==true &&isVisible3==false){
                          setState(() {
                            textFiled1.clear();
                            textFiled2.clear();
                            isVisible3=true;
                          });
                        }

                      }



                    }, child:Text('Add'),
                    style:ElevatedButton.styleFrom(primary: Colors.blue,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)) )
                    ),
                  ),
                ),

              ],
            ),
            VisibilityClass(isVisible: isVisible1, name: name1, phone: phone1),
            VisibilityClass(isVisible: isVisible2, name: name2, phone: phone2),
            VisibilityClass(isVisible: isVisible3, name: name3, phone: phone3),








          ],
        ),
      ),
    ),


  );
  }
}