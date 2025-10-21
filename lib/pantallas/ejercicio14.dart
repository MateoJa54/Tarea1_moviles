import 'package:flutter/material.dart';

class Ejercicio14Page extends StatefulWidget {
  const Ejercicio14Page({super.key});

  @override
  State<Ejercicio14Page> createState() => _Ejercicio14PageState();
}

class _Ejercicio14PageState extends State<Ejercicio14Page> {
  final numeroCtrl = TextEditingController();

  String resultado = '';

  void verificarNumeroPerfecto() {
    final numero = int.tryParse(numeroCtrl.text);

    if (numero == null || numero <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Ingrese un numero entero positivo.')),
      );
      return;
    }

    int suma = 0;

    for (int i = 1; i < numero; i++) {
      if (numero % i == 0) {
        suma += i;
      }
    }

    setState(() {
      if (suma == numero) {
        resultado = 'El numero $numero es perfecto.';
      } else {
        resultado = 'El numero $numero no es perfecto.';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = const Color(0xFF4A7856);
    final Color accentColor = const Color(0xFFF1E8B8);
    final Color backgroundColor = const Color(0xFFF6F5F0);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejercicio 14 — Número Perfecto'),
        centerTitle: true,
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
      ),
      backgroundColor: backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: accentColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text(
                'Verificar número perfecto',
                style: TextStyle(
                  fontSize: 20, 
                  fontWeight: FontWeight.bold
                ),
              ),
            ),

            const SizedBox(height: 12),
            TextField(
              controller: numeroCtrl,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Ingrese un número entero positivo',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),

            const SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                padding: const EdgeInsets.symmetric(vertical: 14),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: verificarNumeroPerfecto,
              child: const Text('Verificar'),
            ),

            const SizedBox(height: 20),
            Text(
              resultado,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
