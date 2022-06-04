import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("Add Values in String Array in Flutter"),
            centerTitle: true,
          ),
          body: SafeArea(
              child: Center(
            child: AppWidget(),
          ))),
    );
  }
}

class AppWidget extends StatefulWidget {
  @override
  AppWidgetState createState() => AppWidgetState();
}

class AppWidgetState extends State<AppWidget> {
  final textFieldValueHolder = TextEditingController();

  final List<String> data = [];

  showAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text('Please Enter Value in Text Field.'),
          actions: <Widget>[
            FlatButton(
              child: new Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void addValue() {
    if (textFieldValueHolder.text == '') {
      showAlert(context);
    } else {
      setState(() {
        data.add(textFieldValueHolder.text);
      });
      print(data);
    }
  }

  Widget build(BuildContext context) {
    return Center(
        child: SingleChildScrollView(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            width: 280,
            padding: EdgeInsets.all(10.0),
            child: TextField(
              controller: textFieldValueHolder,
              autocorrect: true,
              decoration: InputDecoration(hintText: 'Enter Some Text Here'),
            )),
        Container(
          margin: const EdgeInsets.all(10),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.lightBlue,
              padding: EdgeInsets.all(12),
              textStyle: TextStyle(fontSize: 22),
            ),
            child: Text('Add Value from input'),
            onPressed: addValue,
          ),
        ),
        Text(
          '${data.join("\n\n" + " ")}',
          style: TextStyle(fontSize: 20, color: Colors.black),
          textAlign: TextAlign.center,
        )
      ],
    )));
  }
}
