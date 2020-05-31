import 'package:flutter/material.dart';
import 'package:timer_app/widgets.dart';
import 'package:percent_indicator/percent_indicator.dart';
import './timer.dart';
import './timermodel.dart';
import 'settings.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final CountDownTimer timer = CountDownTimer();

  @override
  Widget build(BuildContext context) {
    timer.startWork();
    return MaterialApp(
      title: "My Work Timer",
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: TimerHomePage(),
    );
  }

  void emptyMethod() {}
}

class TimerHomePage extends StatelessWidget {
  final CountDownTimer timer = CountDownTimer();

  void goToSettings(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => SettingsScreen()));
  }

  @override
  Widget build(BuildContext context) {
    final List<PopupMenuItem<String>> menuItems = List<PopupMenuItem<String>>();
    menuItems.add(PopupMenuItem(value: 'Settings', child: Text('Settings')));

    return Scaffold(
        appBar: AppBar(title: Text("My work timer"), actions: [
          PopupMenuButton<String>(itemBuilder: (BuildContext context) {
            return menuItems.toList();
          }, onSelected: (s) {
            if (s == 'Settings') {
              goToSettings(context);
            }
          })
        ]),
        body: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          final double availableWidth = constraints.maxWidth;
          return Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(8.0),
                  ),
                  Expanded(
                      child: ProductivityButton(
                    color: Color(0xff009688),
                    text: "Work",
                    onPressed: () => timer.startWork(),
                    size: 23,
                  )),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                  ),
                  Expanded(
                      child: ProductivityButton(
                    color: Color(0xff607D8B),
                    text: "Short Break",
                    onPressed: () => timer.startBreak(true),
                    size: 23,
                  )),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                  ),
                  Expanded(
                      child: ProductivityButton(
                    color: Color(0xff455A64),
                    text: "Long Break",
                    onPressed: () => timer.startBreak(false),
                    size: 23,
                  )),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                  ),
                ],
              ),
              Expanded(
                  child: StreamBuilder(
                      initialData: '00:00',
                      stream: timer.stream(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        TimerModel timer = (snapshot.data == "00:00")
                            ? TimerModel('00:00', 1)
                            : snapshot.data;
                        return Expanded(
                          child: CircularPercentIndicator(
                            radius: availableWidth / 2,
                            lineWidth: 10.0,
                            percent: timer.percent,
                            center: Text(timer.time,
                                style: Theme.of(context).textTheme.display1),
                            progressColor: Color(0xff009688),
                          ),
                        );
                      })),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                  ),
                  Expanded(
                      child: ProductivityButton(
                    color: Color(0xff212121),
                    text: 'Stop',
                    onPressed: () => timer.stopTimer(),
                    size: 23,
                  )),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                  ),
                  Expanded(
                      child: ProductivityButton(
                    color: Color(0xff009688),
                    text: 'Restart',
                    onPressed: () => timer.startTimer(),
                    size: 23,
                  )),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                  ),
                ],
              )
            ],
          );
        }));
  }

  void emptyMethod() {}
}
