import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:tarea_1/main.dart';

void main() {
  testWidgets('Muestra el título del menú principal', (
    WidgetTester tester,
  ) async {
    // Construir la app y generar un frame
    await tester.pumpWidget(const EjerciciosApp());

    // Verificar que se muestre el título del AppBar
    expect(find.text('Menú de Ejercicios'), findsOneWidget);
  });

  testWidgets('Navegar a Ejercicio 11 desde el menú', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const EjerciciosApp());

    expect(find.text('Ejercicio 11'), findsOneWidget);

    await tester.tap(find.text('Ejercicio 11'));
    await tester.pumpAndSettle();

    expect(find.text('Ejercicio 11'), findsOneWidget);
  });
}
