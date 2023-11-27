import 'package:flutter/material.dart';
class LengthConverter extends StatefulWidget {
  @override
  _LengthConverterState createState() => _LengthConverterState();
}
class _LengthConverterState extends State<LengthConverter> {
  double inputValue = 0.0;
  double outputValue = 0.0;
  String sourceUnit = 'Meter';
  String targetUnit = 'Meter';

  final List<String> units = ['Meter', 'Kilometer', 'Mile', 'Yard', 'Foot', 'Inch'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Length Converter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  inputValue = double.tryParse(value) ?? 0.0;
                });
              },
              decoration: InputDecoration(labelText: 'Enter Length'),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DropdownButton<String>(
                  value: sourceUnit,
                  onChanged: (value) {
                    setState(() {
                      sourceUnit = value!;
                    });
                  },
                  items: units.map((unit) {
                    return DropdownMenuItem<String>(
                      value: unit,
                      child: Text(unit),
                    );
                  }).toList(),
                ),
                Text('to'),
                DropdownButton<String>(
                  value: targetUnit,
                  onChanged: (value) {
                    setState(() {
                      targetUnit = value!;
                    });
                  },
                  items: units.map((unit) {
                    return DropdownMenuItem<String>(
                      value: unit,
                      child: Text(unit),
                    );
                  }).toList(),
                ),
              ],
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                convertLength();
              },
              child: Text('Convert'),
            ),
            SizedBox(height: 10),
            Text('Result: $outputValue $targetUnit'),
          ],
        ),
      ),
    );
  }

  void convertLength() {
    double inputValueInMeter = inputValue;
    switch (sourceUnit) {
      case 'Kilometer':
        inputValueInMeter = inputValue * 1000.0;
        break;
      case 'Mile':
        inputValueInMeter = inputValue * 1609.34;
        break;
      case 'Yard':
        inputValueInMeter = inputValue * 0.9144;
        break;
      case 'Foot':
        inputValueInMeter = inputValue * 0.3048;
        break;
      case 'Inch':
        inputValueInMeter = inputValue * 0.0254;
        break;
    }

    switch (targetUnit) {
      case 'Meter':
        outputValue = inputValueInMeter;
        break;
      case 'Kilometer':
        outputValue = inputValueInMeter / 1000.0;
        break;
      case 'Mile':
        outputValue = inputValueInMeter / 1609.34;
        break;
      case 'Yard':
        outputValue = inputValueInMeter / 0.9144;
        break;
      case 'Foot':
        outputValue = inputValueInMeter / 0.3048;
        break;
      case 'Inch':
        outputValue = inputValueInMeter / 0.0254;
        break;
    }

    setState(() {});
  }
}
