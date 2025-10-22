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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ejercicios Flutter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      // Ruta inicial: un menú simple para navegar a cada ejercicio
      initialRoute: '/',
      routes: {
        '/': (context) => const MenuEjerciciosPage(),
        '/ej11': (context) => const Ejercicio11Page(),
        '/ej12': (context) => const Ejercicio12Page(),
        '/ej13': (context) => const Ejercicio13Page(),
        '/ej14': (context) => const Ejercicio14Page(),
        // '/ej15': (context) => const Ejercicio15Page(),
      },
    );
  }
}

/// Menú de navegación
class MenuEjerciciosPage extends StatelessWidget {
  const MenuEjerciciosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menú de Ejercicios'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          _NavButton(text: 'Ejercicio 11', route: '/ej11'),
          _NavButton(text: 'Ejercicio 12', route: '/ej12'),
          _NavButton(text: 'Ejercicio 13', route: '/ej13'),
          _NavButton(text: 'Ejercicio 14', route: '/ej14'),
          _NavButton(text: 'Ejercicio 15', route: '/ej15'),
        ],
      ),
    );
  }
}

/// Botón reutilizable para navegar con rutas nombradas
class _NavButton extends StatelessWidget {
  final String text;
  final String route;
  const _NavButton({super.key, required this.text, required this.route});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        onPressed: () => Navigator.pushNamed(context, route),
        child: Text(text),
      ),
    );
  }
}
