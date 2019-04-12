import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello You',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HelloYou(),
    );
  }
}
class HelloYou extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _HelloYouState();
}
class _HelloYouState extends State<HelloYou>{
  String name="";
  final _currencies = ["Dollars", "Euro", "Pounds"];
  String currency = "Dollars";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                hintText: 'Please Enter your name'
              ),
              // onSubmitted: (String string){
              //   setState((){
              //     name= string;
              //   });
              // },
              onChanged: (String string){
                setState((){
                  name= string;
                });
              },
              ),
              DropdownButton<String>(
                items: _currencies.map((String value){
                  return DropdownMenuItem<String>( value: value, child: Text(value));
                }).toList(),
                value: currency,
                onChanged: (String value){
                  _onDropdownChanged(value);
                },
              ),
              Text('Hello '+name+'!',)
          ],
        ),
      ),
      );
  }
  _onDropdownChanged(String value){
    this.setState((){
      currency = value ;
    }) ;
  }

}
