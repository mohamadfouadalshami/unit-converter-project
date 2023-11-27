import 'package:flutter/material.dart';
class AreaConverter extends StatefulWidget {
  @override
  _AreaConverterState createState() => _AreaConverterState();
}
class _AreaConverterState extends State<AreaConverter> {
  double inputValue = 0.0;
  double outputValue = 0.0;
  String sourceUnit = 'Square Meter';
  String targetUnit = 'Square Meter';
  final List<String> units = ['Square Meter', 'Square Kilometer', 'Square Mile', 'Square Yard', 'Square Foot', 'Square Inch'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Area Converter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
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
              decoration: InputDecoration(labelText: 'Enter Area'),
            ),
            SizedBox(height: 20),
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
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                convertArea();
              },
              child: Text('Convert'),
            ),
            SizedBox(height: 20),
            Text('Result: $outputValue $targetUnit'),
          ],
        ),
      ),
    );
  }


  void convertArea() {
    // Conversion logic
    double inputValueInSquareMeter = inputValue;

    switch (sourceUnit) {
      case 'Square Kilometer':
        inputValueInSquareMeter = inputValue * 1e6;
        break;
      case 'Square Mile':
        inputValueInSquareMeter = inputValue * 2.59e6;
        break;
      case 'Square Yard':
        inputValueInSquareMeter = inputValue * 0.836127;
        break;
      case 'Square Foot':
        inputValueInSquareMeter = inputValue * 0.092903;
        break;
      case 'Square Inch':
        inputValueInSquareMeter = inputValue * 0.00064516;
        break;
    }

    switch (targetUnit) {
      case 'Square Meter':
        outputValue = inputValueInSquareMeter;
        break;
      case 'Square Kilometer':
        outputValue = inputValueInSquareMeter * 1e-6;
        break;
      case 'Square Mile':
        outputValue = inputValueInSquareMeter * 3.861e-7;
        break;
      case 'Square Yard':
        outputValue = inputValueInSquareMeter / 0.836127;
        break;
      case 'Square Foot':
        outputValue = inputValueInSquareMeter / 0.092903;
        break;
      case 'Square Inch':
        outputValue = inputValueInSquareMeter / 0.00064516;
        break;
    }

    setState(() {});
  }
}
