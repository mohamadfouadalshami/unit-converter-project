import 'package:flutter/material.dart';

class TimeConverter extends StatefulWidget {
  @override
  _TimeConverterState createState() => _TimeConverterState();
}

class _TimeConverterState extends State<TimeConverter> {
  double inputValue = 0.0;
  double outputValue = 0.0;
  String sourceUnit = 'Second';
  String targetUnit = 'Second';

  final List<String> units = ['Second', 'Minute', 'Hour', 'Day'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Time Converter'),
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
              decoration: InputDecoration(labelText: 'Enter Time'),
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
                convertTime();
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

  void convertTime() {
    // Conversion logic
    double inputValueInSecond = inputValue;

    switch (sourceUnit) {
      case 'Minute':
        inputValueInSecond = inputValue * 60.0;
        break;
      case 'Hour':
        inputValueInSecond = inputValue * 3600.0;
        break;
      case 'Day':
        inputValueInSecond = inputValue * 86400.0;
        break;
    }

    switch (targetUnit) {
      case 'Second':
        outputValue = inputValueInSecond;
        break;
      case 'Minute':
        outputValue = inputValueInSecond / 60.0;
        break;
      case 'Hour':
        outputValue = inputValueInSecond / 3600.0;
        break;
      case 'Day':
        outputValue = inputValueInSecond / 86400.0;
        break;
    }

    setState(() {});
  }
}
