import 'package:flutter/material.dart';

class Ejercicio13Page extends StatefulWidget {
  const Ejercicio13Page({super.key});

  @override
  State<Ejercicio13Page> createState() => _Ejercicio13PageState();
}

class _Ejercicio13PageState extends State<Ejercicio13Page> {
  final anioCtrl = TextEditingController();
  String resultado = '';

  //logica
  bool esBisiesto(int anio) {
    if (anio % 400 == 0) {
      return true;
    } else if (anio % 100 == 0) {
      return false;
    } else if (anio % 4 == 0) {
      return true;
    } else {
      return false;
    }
  }

  void calcularAnio() {
    final anio = int.tryParse(anioCtrl.text);

    if (anio == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Ingresa un año válido.')));
      return;
    }

    setState(() {
      if (esBisiesto(anio)) {
        resultado = 'El año $anio es bisiesto';
      } else {
        resultado = 'El año $anio no es bisiesto';
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
        title: const Text('Ejercicio — Año Bisiesto'),
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
                'Verificar Año Bisiesto',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: anioCtrl,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Ingrese el año',
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
              onPressed: calcularAnio,
              child: const Text('Calcular'),
            ),
            const SizedBox(height: 20),
            if (resultado.isNotEmpty)
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: primaryColor, width: 2),
                ),
                child: Text(
                  resultado,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
