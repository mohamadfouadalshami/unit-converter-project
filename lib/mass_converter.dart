//mostafa fahed
import 'package:flutter/material.dart';
class MassConverter extends StatefulWidget {
  @override
  _MassConverterState createState() => _MassConverterState();
}
class _MassConverterState extends State<MassConverter> {
  double inputValue = 0.0;
  double outputValue = 0.0;
  String sourceUnit = 'Kilogram';
  String targetUnit = 'Kilogram';
  final List<String> units = ['Kilogram', 'Gram', 'Pound', 'Ounce'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mass Converter'),
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
              decoration: InputDecoration(labelText: 'Enter Mass'),
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
                convertMass();
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

  void convertMass() {
    double inputValueInKilogram = inputValue;
    switch (sourceUnit) {
      case 'Gram':
        inputValueInKilogram = inputValue / 1000.0;
        break;
      case 'Pound':
        inputValueInKilogram = inputValue * 0.453592;
        break;
      case 'Ounce':
        inputValueInKilogram = inputValue * 0.0283495;
        break;
    }

    switch (targetUnit) {
      case 'Kilogram':
        outputValue = inputValueInKilogram;
        break;
      case 'Gram':
        outputValue = inputValueInKilogram * 1000.0;
        break;
      case 'Pound':
        outputValue = inputValueInKilogram / 0.453592;
        break;
      case 'Ounce':
        outputValue = inputValueInKilogram / 0.0283495;
        break;
    }

    setState(() {});
  }
}
