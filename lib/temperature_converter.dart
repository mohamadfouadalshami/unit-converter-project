import 'package:flutter/material.dart';
class TemperatureConverter extends StatefulWidget {
  @override
  _TemperatureConverterState createState() => _TemperatureConverterState();
}
class _TemperatureConverterState extends State<TemperatureConverter> {
  double inputValue = 0.0;
  double outputValue = 0.0;
  String sourceUnit = 'Celsius';
  String targetUnit = 'Celsius';
  final List<String> units = ['Celsius', 'Fahrenheit', 'Kelvin'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Temperature Converter'),
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
              decoration: InputDecoration(labelText: 'Enter Temperature'),
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
                convertTemperature();
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

  void convertTemperature() {
    // Conversion logic
    if (sourceUnit == 'Celsius' && targetUnit == 'Fahrenheit') {
      outputValue = (inputValue * 9 / 5) + 32;
    } else if (sourceUnit == 'Celsius' && targetUnit == 'Kelvin') {
      outputValue = inputValue + 273.15;
    } else if (sourceUnit == 'Fahrenheit' && targetUnit == 'Celsius') {
      outputValue = (inputValue - 32) * 5 / 9;
    } else if (sourceUnit == 'Fahrenheit' && targetUnit == 'Kelvin') {
      outputValue = (inputValue - 32) * 5 / 9 + 273.15;
    } else if (sourceUnit == 'Kelvin' && targetUnit == 'Celsius') {
      outputValue = inputValue - 273.15;
    } else if (sourceUnit == 'Kelvin' && targetUnit == 'Fahrenheit') {
      outputValue = (inputValue - 273.15) * 9 / 5 + 32;
    } else {
      outputValue = inputValue; // Same units, no conversion needed
    }

    setState(() {});
  }
}
