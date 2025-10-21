import 'package:flutter/material.dart';

class Ejercicio11Page extends StatefulWidget {
  const Ejercicio11Page({super.key});

  @override
  State<Ejercicio11Page> createState() => _Ejercicio11PageState();
}

class _Ejercicio11PageState extends State<Ejercicio11Page> {
  final clienteCtrl = TextEditingController();
  final articuloCtrl = TextEditingController();
  final precioCtrl = TextEditingController();
  final cantidadCtrl = TextEditingController();

  double subtotalCliente = 0.0;
  double montoUltimoCliente = 0.0;
  double totalDia = 0.0;
  String ultimoCliente = '';
  int articulosCliente = 0;

  final List<String> registroDia = <String>[];

  void agregarArticulo() {
    final precio = double.tryParse(precioCtrl.text) ?? 0.0;
    final cantidad = double.tryParse(cantidadCtrl.text) ?? 0.0;

    setState(() {
      subtotalCliente += precio * cantidad;
      articulosCliente += cantidad.round();

      articuloCtrl.clear();
      precioCtrl.clear();
      cantidadCtrl.clear();
    });
  }

  void cobrarCliente() {
    final nombre = clienteCtrl.text.trim().isEmpty
        ? 'Cliente s/n'
        : clienteCtrl.text.trim();

    setState(() {
      montoUltimoCliente = subtotalCliente;
      totalDia += subtotalCliente;
      ultimoCliente = nombre;

      registroDia.add(
        '$nombre — \$${montoUltimoCliente.toStringAsFixed(2)} (${articulosCliente} art.)',
      );

      subtotalCliente = 0.0;
      articulosCliente = 0;
      clienteCtrl.clear();
    });
  }

  void reiniciarDia() {
    setState(() {
      subtotalCliente = 0.0;
      montoUltimoCliente = 0.0;
      totalDia = 0.0;
      ultimoCliente = '';
      articulosCliente = 0;
      registroDia.clear();
      clienteCtrl.clear();
      articuloCtrl.clear();
      precioCtrl.clear();
      cantidadCtrl.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = const Color(0xFF4A7856);
    final Color accentColor = const Color(0xFFF1E8B8);
    final Color secondaryColor = const Color(0xFFD9CAB3);
    final Color backgroundColor = const Color(0xFFF6F5F0);
    final Color textColor = const Color(0xFF2E2E2E);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejercicio 11 — Caja Supermercado'),
        centerTitle: true,
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        elevation: 2,
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
                child: Text(
                  'Datos del cliente',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: clienteCtrl,
                decoration: InputDecoration(
                  labelText: 'Nombre del cliente',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),

              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: accentColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  'Captura de artículos',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: articuloCtrl,
                decoration: InputDecoration(
                  labelText: 'Nombre del artículo',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: precioCtrl,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Precio (USD)',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: cantidadCtrl,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Cantidad',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),

              const SizedBox(height: 12),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: agregarArticulo,
                child: const Text('Agregar artículo al cliente'),
              ),

              const SizedBox(height: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFD99559),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: cobrarCliente,
                child: const Text('Cobrar cliente'),
              ),

              const SizedBox(height: 16),
              Text(
                'Monto del cliente actual: \$${subtotalCliente.toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 18,
                  color: primaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                'Último cliente cobrado: ${ultimoCliente.isEmpty ? '-' : ultimoCliente}',
                style: TextStyle(fontSize: 18, color: textColor),
              ),
              Text(
                'Monto cobrado al último cliente: \$${montoUltimoCliente.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 18, color: textColor),
              ),
              Text(
                'Total cobrado en el día: \$${totalDia.toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 18,
                  color: primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: accentColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  'Resumen para el supervisor',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: secondaryColor,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: registroDia.isEmpty
                    ? Text(
                        'Sin cobros registrados aún',
                        style: TextStyle(color: textColor),
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: registroDia
                            .map(
                              (linea) => Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 4,
                                ),
                                child: Text(
                                  linea,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: textColor,
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
              ),

              const SizedBox(height: 12),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.red.shade700,
                  side: BorderSide(color: Colors.red.shade700),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                onPressed: reiniciarDia,
                child: const Text('Reiniciar día'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
