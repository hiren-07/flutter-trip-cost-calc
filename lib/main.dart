import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trip Cost Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FualForm(),
    );
  }
}

class FualForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FualFormState();
}

class _FualFormState extends State<FualForm> {
  final _formDistance = 5.0 ;
  final _currencies = ["Dollars", "Euro", "Pounds"];
  String currency = "Dollars";
  String result = "";
  TextEditingController distanceController = TextEditingController();
  TextEditingController avgController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.title;
    return Scaffold(
      appBar: AppBar(
        title: Text("Trip Cost Calculator"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                top: _formDistance,
                bottom: _formDistance
              ),
              child: TextField(
              keyboardType: TextInputType.number,
              controller: distanceController,
              decoration: InputDecoration(
                  labelText: 'Distance',
                  hintText: 'e.g.124',
                  labelStyle: textStyle,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0))),
            ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: _formDistance,
                bottom: _formDistance
              ),
              child: TextField(
              keyboardType: TextInputType.number,
              controller: avgController,
              decoration: InputDecoration(
                  labelText: 'Distance per Unit',
                  hintText: 'e.g.17',
                  labelStyle: textStyle,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0))),
            ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: _formDistance,
                bottom: _formDistance
              ),
              child:Row( children: <Widget>[
              Expanded(child: TextField(
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              controller: priceController,
              decoration: InputDecoration(
                  labelText: 'Price ',
                  hintText: 'e.g.1.65',
                  labelStyle: textStyle,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0))),
            ),
              ),
              Container( width: _formDistance*5,),
              Expanded(
                child: DropdownButton<String>(
              items: _currencies.map((String value) {
                return DropdownMenuItem<String>(
                    value: value, child: Text(value));
              }).toList(),
              value: currency,
              onChanged: (String value) {
                _onDropdownChanged(value);
              },
            ),
              ),
            ],
            ),
            ),
            Row(children: <Widget>[
              Expanded(
                child: RaisedButton(
              color: Theme.of(context).primaryColorDark,
              textColor: Theme.of(context).primaryColorLight,
              child: Text(
                'Submit',
                textScaleFactor: 1.5,
              ),
              onPressed: () {
                setState(() {
                  result = calculate();
                });
              },
            ),
              ),
              Container( width: _formDistance*5,),
              Expanded(
                child: RaisedButton(
              color: Theme.of(context).buttonColor,
              textColor: Theme.of(context).primaryColorDark,
              child: Text(
                'Reset',
                textScaleFactor: 1.5,
              ),
              onPressed: () {
                setState(() {
                  reset();
                });
              },
            ),
              ),
            ],),
            
            Text(result)
          ],
        ),
      ),
    );
  }

  _onDropdownChanged(String value) {
    this.setState(() {
      currency = value;
    });
  }

  String calculate(){
    double _distance = double.parse(distanceController.text);
    double _fualCost = double.parse(priceController.text);
    double _consuption = double.parse(avgController.text);
    double _totalCost = _distance / _consuption * _fualCost ;
    return 'The total cost of your trip is '+ _totalCost.toStringAsFixed(2)+ ' '+ currency ;
  }

  reset(){
      distanceController.text = '';
      avgController.text = '';
      priceController.text = '';
      setState((){
       // currency= 'Dollars';
        result='';
      });
  }
}
