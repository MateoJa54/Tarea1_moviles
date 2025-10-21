import 'package:flutter/material.dart';

class Ejercicio12Page extends StatefulWidget {
  const Ejercicio12Page({super.key});

  @override
  State<Ejercicio12Page> createState() => _Ejercicio12PageState();
}

class _Ejercicio12PageState extends State<Ejercicio12Page> {
  final precioCtrl = TextEditingController();
  final entregadoCtrl = TextEditingController();

  double vuelto = 0.0;
  int m2 = 0;
  int m1 = 0;
  int m050 = 0;
  int m025 = 0;
  int m010 = 0;

  void calcularVuelto() {
    final precio = double.tryParse(precioCtrl.text) ?? 0.0;
    final entregado = double.tryParse(entregadoCtrl.text) ?? 0.0;

    if (entregado < precio) {
      setState(() {
        vuelto = 0.0;
        m2 = m1 = m050 = m025 = m010 = 0;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('El dinero entregado es insuficiente.')),
      );
      return;
    }

    double cambio =
        ((entregado - precio) * 100).roundToDouble() /
        100; // redondear a 2 decimales

    int centavos = (cambio * 100).round();

    m2 = centavos ~/ 200;
    centavos %= 200;

    m1 = centavos ~/ 100;
    centavos %= 100;

    m050 = centavos ~/ 50;
    centavos %= 50;

    m025 = centavos ~/ 25;
    centavos %= 25;

    m010 = centavos ~/ 10;
    centavos %= 10;

    setState(() {
      vuelto = cambio;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = const Color(0xFF4A7856);
    final Color accentColor = const Color(0xFFF1E8B8);
    final Color backgroundColor = const Color(0xFFF6F5F0);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejercicio 12 — Vuelto en Monedas'),
        centerTitle: true,
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
      ),
      backgroundColor: backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
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
                  'Datos de la compra',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: precioCtrl,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Precio del artículo (USD)',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: entregadoCtrl,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Cantidad entregada (USD)',
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
                onPressed: calcularVuelto,
                child: const Text('Calcular vuelto'),
              ),
              const SizedBox(height: 20),
              Text(
                'Vuelto total: \$${vuelto.toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: primaryColor,
                ),
              ),
              const SizedBox(height: 10),
              Text('Monedas de 2: $m2'),
              Text('Monedas de 1: $m1'),
              Text('Monedas de 0.50: $m050'),
              Text('Monedas de 0.25: $m025'),
              Text('Monedas de 0.10: $m010'),
            ],
          ),
        ),
      ),
    );
  }
}
