// mostafa fahed
import 'package:flutter/material.dart';
class VolumeConverter extends StatefulWidget {
  @override
  _VolumeConverterState createState() => _VolumeConverterState();
}
class _VolumeConverterState extends State<VolumeConverter> {
  double inputValue = 0.0;
  double outputValue = 0.0;
  String sourceUnit = 'Cubic Meter';
  String targetUnit = 'Cubic Meter';
  final List<String> units = ['Cubic Meter', 'Liter', 'Milliliter', 'Gallon'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Volume Converter'),
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
              decoration: InputDecoration(labelText: 'Enter Volume'),
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
                convertVolume();
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
  void convertVolume() {
    // Conversion logic
    double inputValueInCubicMeter = inputValue;

    switch (sourceUnit) {
      case 'Liter':
        inputValueInCubicMeter = inputValue / 1000.0;
        break;
      case 'Milliliter':
        inputValueInCubicMeter = inputValue / 1e6;
        break;
      case 'Gallon':
        inputValueInCubicMeter = inputValue * 0.00378541;
        break;
    }
    switch (targetUnit) {
      case 'Cubic Meter':
        outputValue = inputValueInCubicMeter;
        break;
      case 'Liter':
        outputValue = inputValueInCubicMeter * 1000.0;
        break;
      case 'Milliliter':
        outputValue = inputValueInCubicMeter * 1e6;
        break;
      case 'Gallon':
        outputValue = inputValueInCubicMeter / 0.00378541;
        break;
    }
    setState(() {});
  }
}
