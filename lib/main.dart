import 'package:flutter/material.dart';
import 'package:timer_app/widgets.dart';

void main()=> runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
    title:"My Work Timer",
      theme: ThemeData(
      primarySwatch:Colors.blueGrey),
    home: TimerHomePage(),
    );
  }
  void emptyMethod() {}

}
  
class TimerHomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
    appBar:AppBar(
    title:Text("My work timer"),
      ),
      body:Column(
        children: <Widget>[
          Row(children: <Widget>[
            Padding(padding: EdgeInsets.all(8.0),),
            Expanded(child:ProductivityButton(color:Color(0xff009688),
            text: "Work",
            onPressed: emptyMethod,
            size: 23,
            )),
            
            Padding(padding: EdgeInsets.all(8.0),),
             Expanded(child: ProductivityButton(color: Color(0xff607D8B),
             text: "Short Break", onPressed: emptyMethod,  size: 23,)),
             Padding(padding: EdgeInsets.all(8.0),),
             Expanded(child: ProductivityButton(color: Color(0xff455A64),
             text: "Long Break", onPressed: emptyMethod,  size: 23,)),
             Padding(padding: EdgeInsets.all(8.0),),
            
          ],)
        ],
      )
    );
  }
    void emptyMethod() {}

}
