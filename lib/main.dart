import 'package:flutter/material.dart';

// Fungsi utama untuk menjalankan aplikasi Flutter
void main() => runApp(const KalkulatorApp());

// Widget utama aplikasi
class KalkulatorApp extends StatelessWidget {
  const KalkulatorApp({Key? key}) : super(key: key); // Constructor yang benar

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kalkulator',
      theme: ThemeData.dark(),
      home: const KalkulatorScreen(), // Ganti dengan KalkulatorScreen
    );
  }
}

class KalkulatorScreen extends StatelessWidget {
  const KalkulatorScreen({Key? key}) : super(key: key); // Constructor yang benar

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // Output
            Expanded(
              child: SingleChildScrollView(
                reverse: true,
                child: Container(
                  alignment: Alignment.bottomRight,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: const Text(
                    "0",
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // Warna teks
                    ),
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
            ),
            // Buttons
            Wrap(
              children: Btn.buttonValues
                  .map(
                    (value) => SizedBox(
                      width: screenSize.width / 4,
                      height: screenSize.width / 5, // memunculkan angka dll untuk tampilan kalkulator
                      child: buildButton(value),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildButton(String value) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Material(
        color: [Btn.del, Btn.clr].contains(value)
            ? Colors.blueGrey
            : [
                Btn.per,
                Btn.multiply,
                Btn.add,
                Btn.subtract,
                Btn.divide,
                Btn.calculate,
              ].contains(value)
                ? Colors.orange
                : Colors.black87,
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder( // Menggunakan RoundedRectangleBorder
          borderRadius: BorderRadius.circular(100),
          side: const BorderSide(
            color: Colors.white24,
          ),
        ),
        child: InkWell(
          onTap: () {},
          child: Center(
            child: Text(
              value,
              style: const TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
        ),
      ),
    );
  }
}

// Dummy class Btn untuk contoh. Definisikan Btn sesuai dengan kebutuhan Anda
class Btn {
  static const del = 'DEL';
  static const clr = 'CLR';
  static const per = '%';
  static const multiply = 'x';
  static const add = '+';
  static const subtract = '-';
  static const divide = '/';
  static const calculate = '=';
  
  static const buttonValues = [
    '7', '8', '9', multiply,
    '4', '5', '6', subtract,
    '1', '2', '3', add,
    clr, '0', calculate, divide,
  ];
}
