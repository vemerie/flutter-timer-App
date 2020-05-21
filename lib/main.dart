import 'package:flutter/material.dart';
import 'package:timer_app/widgets.dart';
import 'package:percent_indicator/percent_indicator.dart';

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
      body:
       LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
      final double availableWidth = constraints.maxWidth;
      return Column(
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
            
          ],),

                      Expanded(
            child: CircularPercentIndicator(
            radius: availableWidth / 2,
            lineWidth: 10.0,
            percent: 1,
            center: Text("30:00",
            style: Theme.of(context).textTheme.display1),
            progressColor: Color(0xff009688),
             ),
            ),

          
          Row(children: [
             Padding(padding: EdgeInsets.all(8.0),),
             Expanded(child: ProductivityButton(color: Color(0xff212121),
             text: 'Stop', onPressed: emptyMethod, size: 23,)),
             Padding(padding: EdgeInsets.all(8.0),),
             Expanded(child: ProductivityButton(color: Color(0xff009688),
             text: 'Restart', onPressed: emptyMethod,size: 23,)),
             Padding(padding: EdgeInsets.all(8.0),),
        ],)


        ],
      );
      }
    )
    );
  }
    void emptyMethod() {}

}
