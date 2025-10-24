import 'package:flutter/material.dart';

// Importa tus pantallas
import 'pantallas/ejercicio11.dart';
import 'pantallas/ejercicio12.dart';
import 'pantallas/ejercicio13.dart';
import 'pantallas/ejercicio14.dart';
import 'pantallas/ejercicio15.dart';

void main() => runApp(const EjerciciosApp());

/// App raíz con rutas nombradas para 5 ejercicios
class EjerciciosApp extends StatelessWidget {
  const EjerciciosApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Paleta coherente con Ejercicio 11
    const primaryColor = Color(0xFF4A7856); // verde oliva
    const accentColor = Color(0xFFF1E8B8); // dorado suave
    const backgroundColor = Color(0xFFF6F5F0); // gris cálido

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ejercicios Flutter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
          centerTitle: true,
          elevation: 2,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),
      // Ruta inicial: menú con el mismo patrón visual del Ejercicio 11
      initialRoute: '/',
      routes: {
        '/': (context) => const MenuEjerciciosPage(),
        '/ej11': (context) => const Ejercicio11Page(),
        '/ej12': (context) => const Ejercicio12Page(),
        '/ej13': (context) => const Ejercicio13Page(),
        '/ej14': (context) => const Ejercicio14Page(),
        '/ej15': (context) => const Ejercicio15Page(),
      },
    );
  }
}

/// Menú de navegación (misma estética que Ejercicio 11)
class MenuEjerciciosPage extends StatelessWidget {
  const MenuEjerciciosPage({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF4A7856);
    const accentColor = Color(0xFFF1E8B8);
    const secondaryColor = Color(0xFFD9CAB3);
    const backgroundColor = Color(0xFFF6F5F0);

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(title: const Text('Menú de Ejercicios')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Encabezado en caja (como en tus secciones)
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: accentColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text(
                'Selecciona un ejercicio',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2E2E2E),
                ),
              ),
            ),
            const SizedBox(height: 12),

            // Tarjeta ligera con fondo beige (opcional, igual al resumen del 11)
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: secondaryColor,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: const Text(
                'Navega a cada ejercicio para practicar operaciones y lógica básica.',
                style: TextStyle(fontSize: 14),
              ),
            ),

            const SizedBox(height: 40),

            const _NavButton(text: 'Ejercicio 11', route: '/ej11'),
            const SizedBox(height: 20),
            const _NavButton(text: 'Ejercicio 12 ', route: '/ej12'),
            const SizedBox(height: 20),
            const _NavButton(text: 'Ejercicio 13', route: '/ej13'),
            const SizedBox(height: 20),
            const _NavButton(text: 'Ejercicio 14', route: '/ej14'),
            const SizedBox(height: 20),
            const _NavButton(text: 'Ejercicio 15', route: '/ej15'),
          ],
        ),
      ),
    );
  }
}

/// Botón reutilizable (mismo estilo de botones del Ejercicio 11)
class _NavButton extends StatelessWidget {
  final String text;
  final String route;
  const _NavButton({super.key, required this.text, required this.route});

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF4A7856);

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 25),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      onPressed: () => Navigator.pushNamed(context, route),
      child: Text(text),
    );
  }
}
