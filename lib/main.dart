import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Конвертор',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(), // Головна сторінка
    );
  }
}

// Головний екран з кнопками та заголовком по центру
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Конвертор Одиниць',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => KilometerToMileConverter()),
                  );
                },
                child: const Text('Кілометри в Мілі'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const InchToCentimeterConverter()),
                  );
                },
                child: const Text('Дюйми в Сантиметри'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AcreToHectareConverter()),
                  );
                },
                child: const Text('Акри в Гектари'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => KilogramToPoundConverter()),
                  );
                },
                child: const Text('Кілограми в Фунти'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LiterToGallonConverter()),
                  );
                },
                child: const Text('Літри в Галони'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class KilometerToMileConverter extends StatefulWidget {
  @override
  _KilometerToMileConverterState createState() =>
      _KilometerToMileConverterState();
}

class _KilometerToMileConverterState extends State<KilometerToMileConverter> {
  String _kilometers = '';
  String _miles = '';

  void _convertToMiles() {
    if (_kilometers.isNotEmpty) {
      double km = double.parse(_kilometers);
      setState(() {
        _miles = (km * 0.621371).toStringAsFixed(2);
      });
    }
  }

  void _convertToKilometers() {
    if (_miles.isNotEmpty) {
      double mi = double.parse(_miles);
      setState(() {
        _kilometers = (mi / 0.621371).toStringAsFixed(2);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Кілометри в Мілі'),
      ),
      body: ConverterWidget(
        firstUnitLabel: 'Кілометри',
        secondUnitLabel: 'Мілі',
        firstValue: _kilometers,
        secondValue: _miles,
        onConvertFirstToSecond: _convertToMiles,
        onConvertSecondToFirst: _convertToKilometers,
        onFirstValueChanged: (value) {
          setState(() {
            _kilometers = value;
            _miles = '';
          });
        },
        onSecondValueChanged: (value) {
          setState(() {
            _miles = value;
            _kilometers = '';
          });
        },
      ),
    );
  }
}

class InchToCentimeterConverter extends StatefulWidget {
  const InchToCentimeterConverter({super.key});

  @override
  _InchToCentimeterConverterState createState() =>
      _InchToCentimeterConverterState();
}

class _InchToCentimeterConverterState extends State<InchToCentimeterConverter> {
  String _inches = '';
  String _centimeters = '';

  void _convertToCentimeters() {
    if (_inches.isNotEmpty) {
      double inch = double.parse(_inches);
      setState(() {
        _centimeters = (inch * 2.54).toStringAsFixed(2);
      });
    }
  }

  void _convertToInches() {
    if (_centimeters.isNotEmpty) {
      double cm = double.parse(_centimeters);
      setState(() {
        _inches = (cm / 2.54).toStringAsFixed(2);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Дюйми в Сантиметри'),
      ),
      body: ConverterWidget(
        firstUnitLabel: 'Дюйми',
        secondUnitLabel: 'Сантиметри',
        firstValue: _inches,
        secondValue: _centimeters,
        onConvertFirstToSecond: _convertToCentimeters,
        onConvertSecondToFirst: _convertToInches,
        onFirstValueChanged: (value) {
          setState(() {
            _inches = value;
            _centimeters = '';
          });
        },
        onSecondValueChanged: (value) {
          setState(() {
            _centimeters = value;
            _inches = '';
          });
        },
      ),
    );
  }
}

class AcreToHectareConverter extends StatefulWidget {
  @override
  _AcreToHectareConverterState createState() => _AcreToHectareConverterState();
}

class _AcreToHectareConverterState extends State<AcreToHectareConverter> {
  String _acres = '';
  String _hectares = '';

  void _convertToHectares() {
    if (_acres.isNotEmpty) {
      double acre = double.parse(_acres);
      setState(() {
        _hectares = (acre * 0.404686).toStringAsFixed(2);
      });
    }
  }

  void _convertToAcres() {
    if (_hectares.isNotEmpty) {
      double hectare = double.parse(_hectares);
      setState(() {
        _acres = (hectare / 0.404686).toStringAsFixed(2);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Акри в Гектари'),
      ),
      body: ConverterWidget(
        firstUnitLabel: 'Акри',
        secondUnitLabel: 'Гектари',
        firstValue: _acres,
        secondValue: _hectares,
        onConvertFirstToSecond: _convertToHectares,
        onConvertSecondToFirst: _convertToAcres,
        onFirstValueChanged: (value) {
          setState(() {
            _acres = value;
            _hectares = '';
          });
        },
        onSecondValueChanged: (value) {
          setState(() {
            _hectares = value;
            _acres = '';
          });
        },
      ),
    );
  }
}

class KilogramToPoundConverter extends StatefulWidget {
  @override
  _KilogramToPoundConverterState createState() =>
      _KilogramToPoundConverterState();
}

class _KilogramToPoundConverterState extends State<KilogramToPoundConverter> {
  String _kilograms = '';
  String _pounds = '';

  void _convertToPounds() {
    if (_kilograms.isNotEmpty) {
      double kg = double.parse(_kilograms);
      setState(() {
        _pounds = (kg * 2.20462).toStringAsFixed(2);
      });
    }
  }

  void _convertToKilograms() {
    if (_pounds.isNotEmpty) {
      double lb = double.parse(_pounds);
      setState(() {
        _kilograms = (lb / 2.20462).toStringAsFixed(2);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Кілограми в Фунти'),
      ),
      body: ConverterWidget(
        firstUnitLabel: 'Кілограми',
        secondUnitLabel: 'Фунти',
        firstValue: _kilograms,
        secondValue: _pounds,
        onConvertFirstToSecond: _convertToPounds,
        onConvertSecondToFirst: _convertToKilograms,
        onFirstValueChanged: (value) {
          setState(() {
            _kilograms = value;
            _pounds = '';
          });
        },
        onSecondValueChanged: (value) {
          setState(() {
            _pounds = value;
            _kilograms = '';
          });
        },
      ),
    );
  }
}

class LiterToGallonConverter extends StatefulWidget {
  @override
  _LiterToGallonConverterState createState() => _LiterToGallonConverterState();
}

class _LiterToGallonConverterState extends State<LiterToGallonConverter> {
  String _liters = '';
  String _gallons = '';

  void _convertToGallons() {
    if (_liters.isNotEmpty) {
      double liter = double.parse(_liters);
      setState(() {
        _gallons = (liter * 0.264172).toStringAsFixed(2);
      });
    }
  }

  void _convertToLiters() {
    if (_gallons.isNotEmpty) {
      double gallon = double.parse(_gallons);
      setState(() {
        _liters = (gallon / 0.264172).toStringAsFixed(2);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Літри в Галони'),
      ),
      body: ConverterWidget(
        firstUnitLabel: 'Літри',
        secondUnitLabel: 'Галони',
        firstValue: _liters,
        secondValue: _gallons,
        onConvertFirstToSecond: _convertToGallons,
        onConvertSecondToFirst: _convertToLiters,
        onFirstValueChanged: (value) {
          setState(() {
            _liters = value;
            _gallons = '';
          });
        },
        onSecondValueChanged: (value) {
          setState(() {
            _gallons = value;
            _liters = '';
          });
        },
      ),
    );
  }
}

class ConverterWidget extends StatelessWidget {
  final String firstUnitLabel;
  final String secondUnitLabel;
  final String firstValue;
  final String secondValue;
  final Function() onConvertFirstToSecond;
  final Function() onConvertSecondToFirst;
  final Function(String) onFirstValueChanged;
  final Function(String) onSecondValueChanged;

  const ConverterWidget({
    required this.firstUnitLabel,
    required this.secondUnitLabel,
    required this.firstValue,
    required this.secondValue,
    required this.onConvertFirstToSecond,
    required this.onConvertSecondToFirst,
    required this.onFirstValueChanged,
    required this.onSecondValueChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              labelText: firstUnitLabel,
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
            onChanged: onFirstValueChanged,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: onConvertFirstToSecond,
            child: Text('Конвертувати в $secondUnitLabel'),
          ),
          const SizedBox(height: 20),
          TextField(
            decoration: InputDecoration(
              labelText: secondUnitLabel,
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
            onChanged: onSecondValueChanged,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: onConvertSecondToFirst,
            child: Text('Конвертувати в $firstUnitLabel'),
          ),
          const SizedBox(height: 20),
          Text(
            secondValue.isNotEmpty
                ? 'Результат: $secondValue $secondUnitLabel'
                : '',
            style: TextStyle(fontSize: 20),
          ),
          Text(
            firstValue.isNotEmpty
                ? 'Результат: $firstValue $firstUnitLabel'
                : '',
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
