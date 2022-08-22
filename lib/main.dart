// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Telzir Calculator',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        canvasColor: Colors.deepPurple[900],
      ),
      home: const HomePage(title: 'Telzir Calculator'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _selectedOrigin = '011';
  String _selectedDestination = '016';
  String _selectedTime = '0';
  String _selectedPlan = 'FaleMais 30';

  double _calculateRate(String origin, String destination) {
    double rate = 0.0;

    if (origin == '011') {
      if (destination == '016') {
        rate = 1.90;
      } else if (destination == '017') {
        rate = 1.70;
      } else if (destination == '018') {
        rate = 0.90;
      }
    } else if (origin == '016') {
      if (destination == '011') {
        rate = 2.90;
      }
    } else if (origin == '017') {
      if (destination == '011') {
        rate = 2.70;
      }
    } else if (origin == '018') {
      if (destination == '011') {
        rate = 1.90;
      }
    }

    return rate;
  }

  String _calculatePriceWithPlan() {
    switch (_selectedPlan) {
      case 'FaleMais 30':
        return _calculatePriceWithPlan30();
      case 'FaleMais 60':
        return _calculatePriceWithPlan60();
      case 'FaleMais 120':
        return _calculatePriceWithPlan120();
    }

    return "0,00";
  }

  String _calculatePriceWithPlan30() {
    double rate = _calculateRate(_selectedOrigin, _selectedDestination);
    int time = int.parse(_selectedTime == '' ? '0' : _selectedTime);

    if (rate == 0.0) {
      return "-";
    } else if (time <= 30) {
      return "0,00";
    } else {
      double price = (time - 30) * rate * 1.1;
      return price.toStringAsFixed(2);
    }
  }

  String _calculatePriceWithPlan60() {
    double rate = _calculateRate(_selectedOrigin, _selectedDestination);
    int time = int.parse(_selectedTime == '' ? '0' : _selectedTime);

    if (rate == 0.0) {
      return "-";
    } else if (time <= 60) {
      return "0,00";
    } else {
      double price = (time - 60) * rate * 1.1;
      return price.toStringAsFixed(2);
    }
  }

  String _calculatePriceWithPlan120() {
    double rate = _calculateRate(_selectedOrigin, _selectedDestination);
    int time = int.parse(_selectedTime == '' ? '0' : _selectedTime);

    if (rate == 0.0) {
      return "-";
    } else if (time <= 120) {
      return "0,00";
    } else {
      double price = (time - 120) * rate * 1.1;
      return price.toStringAsFixed(2);
    }
  }

  String _calculatePriceWithoutPlan() {
    double rate = _calculateRate(_selectedOrigin, _selectedDestination);
    int time = int.parse(_selectedTime == '' ? '0' : _selectedTime);

    double price = time * rate;

    if (rate == 0.0) {
      return "-";
    } else {
      return price.toStringAsFixed(2);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Align(
          alignment: Alignment.topCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Fill the form to calculate how much you can save with Telzir',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              const SizedBox(height: 32),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Expanded(
                      child: SizedBox(
                    width: 1,
                  )),
                  const SizedBox(width: 20),
                  const Expanded(
                      child: SizedBox(
                    width: 1,
                  )),
                  const SizedBox(width: 20),
                  const Expanded(
                      child: SizedBox(
                    width: 1,
                  )),
                  const SizedBox(width: 20),
                  const Expanded(
                      child: SizedBox(
                    width: 1,
                  )),
                  const SizedBox(width: 20),
                  const Expanded(
                    child: Text(
                      "With FaleMais",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  const SizedBox(width: 20),
                  const Expanded(
                    child: Text(
                      "Without FaleMais",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 32),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: DropdownButtonFormField(
                      value: _selectedOrigin,
                      isExpanded: true,
                      items: <String>[
                        '011',
                        '016',
                        '017',
                        '018',
                      ]
                          .map((String item) => DropdownMenuItem<String>(
                              value: item, child: Text(item)))
                          .toList(),
                      onChanged: (String? value) {
                        setState(() {
                          _selectedOrigin = value!;
                        });
                      },
                      style: const TextStyle(color: Colors.white),
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      dropdownColor: Colors.deepPurple[800],
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: DropdownButtonFormField(
                      value: _selectedDestination,
                      isExpanded: true,
                      items: <String>[
                        '011',
                        '016',
                        '017',
                        '018',
                      ]
                          .map((String item) => DropdownMenuItem<String>(
                              value: item, child: Text(item)))
                          .toList(),
                      onChanged: (String? value) {
                        setState(() {
                          _selectedDestination = value!;
                        });
                      },
                      style: const TextStyle(color: Colors.white),
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      dropdownColor: Colors.deepPurple[800],
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          _selectedTime = value;
                        });
                      },
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      keyboardType: TextInputType.number,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        labelText: 'Time (min)',
                        hintText: '20',
                        labelStyle: TextStyle(color: Colors.white),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                                color: Colors.red,
                                width: 2,
                                style: BorderStyle.solid)),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: DropdownButtonFormField(
                      value: _selectedPlan,
                      isExpanded: true,
                      items: <String>[
                        'FaleMais 30',
                        'FaleMais 60',
                        'FaleMais 120'
                      ]
                          .map((String item) => DropdownMenuItem<String>(
                              value: item, child: Text(item)))
                          .toList(),
                      onChanged: (String? value) {
                        setState(() {
                          _selectedPlan = value!;
                        });
                      },
                      style: const TextStyle(color: Colors.white),
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      dropdownColor: Colors.deepPurple[800],
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 32),
                  Expanded(
                    child: Center(
                      child: Text("R\$ ${_calculatePriceWithPlan()}",
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                  const SizedBox(width: 32),
                  Expanded(
                    child: Center(
                      child: Text("R\$ ${_calculatePriceWithoutPlan()}",
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
