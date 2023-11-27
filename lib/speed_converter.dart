import 'package:flutter/material.dart';
class SpeedConverter extends StatefulWidget {
  @override
  _SpeedConverterState createState() => _SpeedConverterState();
}
class _SpeedConverterState extends State<SpeedConverter> {
  double inputValue = 0.0;
  double outputValue = 0.0;
  String sourceUnit = 'Meter/Second';
  String targetUnit = 'Meter/Second';
  final List<String> units = ['Meter/Second', 'Kilometer/Hour', 'Mile/Hour'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Speed Converter'),
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
              decoration: InputDecoration(labelText: 'Enter Speed'),
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
                convertSpeed();
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

  void convertSpeed() {
    double inputValueInMeterPerSecond = inputValue;
    switch (sourceUnit) {
      case 'Kilometer/Hour':
        inputValueInMeterPerSecond = inputValue / 3.6;
        break;
      case 'Mile/Hour':
        inputValueInMeterPerSecond = inputValue / 2.237;
        break;
    }
    switch (targetUnit) {
      case 'Meter/Second':
        outputValue = inputValueInMeterPerSecond;
        break;
      case 'Kilometer/Hour':
        outputValue = inputValueInMeterPerSecond * 3.6;
        break;
      case 'Mile/Hour':
        outputValue = inputValueInMeterPerSecond * 2.237;
        break;
    }

    setState(() {});
  }
}
