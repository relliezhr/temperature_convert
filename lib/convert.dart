import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class converter extends StatefulWidget {
  const converter({super.key});

  @override
  State<converter> createState() => _converterState();
}

class _converterState extends State<converter> {
  double _celcius = 0;
  double _kelvin = 0;
  double _reamur = 0;

  void _convert() {
    setState(() {
      _reamur = (4 / 5) * _celcius;
      _kelvin = _celcius + 273;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.pink,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Konverter Suhu"),
        ),
        body: Container(
          margin: EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please input number';
                  }
                },
                onChanged: (text) {
                  setState(() {
                    _celcius = double.parse(text);
                  });
                },
                decoration: const InputDecoration(
                  labelText: 'Masukkan Suhu Dalam Celcius',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(),
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text("Suhu dalam Kelvin"),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        _kelvin.toString(),
                        style: TextStyle(fontSize: 24),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text("Suhu dalam Reamur"),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        _reamur.toString(),
                        style: TextStyle(fontSize: 24),
                      ),
                    ],
                  ),
                ],
              ),
              ElevatedButton(
                style:
                    ElevatedButton.styleFrom(minimumSize: Size.fromHeight(48)),
                onPressed: _convert,
                child: Text(
                  "Konversi Suhu",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
