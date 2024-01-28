import 'package:flutter/material.dart';

class tryConvert extends StatefulWidget {
  const tryConvert({super.key});

  @override
  State<tryConvert> createState() => _tryConvertState();
}

class _tryConvertState extends State<tryConvert> {
  final formKey = GlobalKey<FormState>();
  final _messangerKey = GlobalKey<ScaffoldMessengerState>();
  TextEditingController input = TextEditingController();

  double kelvin = 0;
  double reamur = 0;
  double fahrenheit = 0;

  calculate() {
    setState(() {
      if (formKey.currentState!.validate()) {
        reamur = 4 / 5 * double.parse(input.text);
        kelvin = double.parse(input.text) + 273;
        fahrenheit = (double.parse(input.text) * 9 / 5) + 32;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: _messangerKey,
      theme: ThemeData(
          primarySwatch: Colors.green,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.adb_sharp, color: Colors.white),
          title: const Text("Flutter Pak Abidin"),
        ),
        body: Container(
          margin: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Form(
                key: formKey,
                child: TextFormField(
                  controller: input,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      _messangerKey.currentState!.showSnackBar(
                          const SnackBar(content: Text("Input number!")));
                    }
                  },
                  decoration: const InputDecoration(
                    labelText: 'Masukkan Suhu Dalam Celcius',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      const Text("Suhu dalam Kelvin"),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        kelvin.toString(),
                        style: TextStyle(fontSize: 24),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const Text("Suhu dalam Reamur"),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        reamur.toString(),
                        style: TextStyle(fontSize: 24),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const Text("Suhu dalam Fahrenheit"),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        fahrenheit.toString(),
                        style: TextStyle(fontSize: 24),
                      ),
                    ],
                  ),
                ],
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(48)),
                onPressed: () {
                  if (formKey.currentState!.validate()) ;
                  {
                    calculate();
                  }
                },
                child: const Text(
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
