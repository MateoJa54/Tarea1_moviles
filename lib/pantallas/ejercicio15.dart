import 'package:flutter/material.dart';

class Ejercicio15Page extends StatefulWidget {
  const Ejercicio15Page({super.key});

  @override
  State<Ejercicio15Page> createState() => _Ejercicio15PageState();
}

class _Ejercicio15PageState extends State<Ejercicio15Page> {
  List<String> namesRegistered = ['Mateo', 'Andres', 'Alan', 'Sofia'];
  List<double> previousWeight = [80, 60, 70.5, 73];
  List<double> previousDifferenceWeight = [-1.2, 1, -0.2, 0.4];

  int? selectedPerson;
  double mediaWeight = 0;
  String resultMessage = '';

  // Mostrar el modal paso a paso (una caja, siguiente/anterior)
void showWeightDialog(BuildContext context) {
  int index = 0;
  List<double> enteredWeights = List.filled(10, 0.0);
  final weightCtrl = TextEditingController();
  String errorText = '';

  void updateController() {
    weightCtrl.text =
        enteredWeights[index] == 0 ? '' : enteredWeights[index].toString();
  }

  updateController();

  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setStateDialog) {
          return AlertDialog(
            title: Text(
                'Registro de pesos (${index + 1} / 10) - ${namesRegistered[selectedPerson!]}'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: weightCtrl,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecoration(
                    labelText: 'Ingrese el peso actual',
                    border: const OutlineInputBorder(),
                    errorText: errorText.isEmpty ? null : errorText,
                  ),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancelar'),
              ),
              if (index > 0)
                TextButton(
                  onPressed: () {
                    enteredWeights[index] =
                        double.tryParse(weightCtrl.text) ?? 0;
                    index--;
                    updateController();
                    setStateDialog(() {
                      errorText = '';
                    });
                  },
                  child: const Text('Anterior'),
                ),
              TextButton(
                onPressed: () {
                  String input = weightCtrl.text.trim();
                  double? weight = double.tryParse(input);

                  if (input.isEmpty) {
                    setStateDialog(() {
                      errorText = 'Por favor ingrese un peso.';
                    });
                    return;
                  }

                  if (weight == null || weight <= 0 || weight > 500) {
                    setStateDialog(() {
                      errorText =
                          'Ingrese un número válido.';
                    });
                    return;
                  }

                  // Si pasa las validaciones
                  enteredWeights[index] = weight;
                  setStateDialog(() {
                    errorText = '';
                  });

                  if (index < 9) {
                    index++;
                    updateController();
                    setStateDialog(() {});
                  } else {
                    Navigator.pop(context);
                    calculate(enteredWeights, selectedPerson!);
                  }
                },
                child: Text(index < 9 ? 'Siguiente' : 'Finalizar'),
              ),
            ],
          );
        },
      );
    },
  );
}


  void calculate(List<double> weights, int numberPerson) {
    if (weights.isEmpty) return;
    mediaWeight = weights.reduce((a, b) => a + b) / weights.length;
    double difference = mediaWeight - previousWeight[numberPerson];
    previousDifferenceWeight[numberPerson] = difference;
    previousWeight[numberPerson] = mediaWeight;

    if (difference < 0) {
      resultMessage =
          '${namesRegistered[numberPerson]} mejoró su peso (bajó ${difference.abs().toStringAsFixed(2)} kg)';
    } else if (difference > 0) {
      resultMessage =
          '${namesRegistered[numberPerson]} subió ${difference.toStringAsFixed(2)} kg';
    } else {
      resultMessage = '${namesRegistered[numberPerson]} mantuvo su peso';
    }

    setState(() {});
  }

  String getPrediction(int idx) {
    double diff = previousDifferenceWeight[idx];
    if (diff > 0.0) {
      return 'Probablemente estará subiendo de peso';
    } else if (diff < 0.0) {
      return 'Probablemente no estará subiendo (mejoró)';
    } else {
      return 'Peso estable (sin cambios previos)';
    }
  }

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = const Color(0xFF4A7856);
    final Color accentColor = const Color(0xFFF1E8B8);
    final Color backgroundColor = const Color(0xFFF6F5F0);
    return Scaffold(
      appBar: AppBar(title: const Text('Registro de Pesos'),
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Dropdown para seleccionar persona
            DropdownButton<int>(
              isExpanded: true,
              hint: const Text('Selecciona una persona'),
              value: selectedPerson,
              dropdownColor: backgroundColor,
              
              items: List.generate(
                namesRegistered.length,
                (index) => DropdownMenuItem(
                  value: index,
                  child: Text(namesRegistered[index]),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  selectedPerson = value;
                  resultMessage = ''; // limpiar mensajes previos si se cambia
                });
              },
            ),

            const SizedBox(height: 20),

            // Contenedor que muestra información según selección
            if (selectedPerson == null)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: accentColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  'Selecciona una persona para ver su información',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 17,
                  ),
                ),
              )
            else
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: accentColor,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.blue),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hola, ${namesRegistered[selectedPerson!]}',
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                    const SizedBox(height: 8),

                    Text(
                      'Peso anterior: ${previousWeight[selectedPerson!].toStringAsFixed(2)} kg',
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 6),

                    Text(
                      'Diferencia previa: ${previousDifferenceWeight[selectedPerson!].toStringAsFixed(2)} kg',
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 6),

                    // Mensaje predictivo
                    Text(
                      getPrediction(selectedPerson!),
                      style: const TextStyle(
                        fontSize: 15,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 12),

                    if (resultMessage.isNotEmpty)
                      Card(
                        color: Colors.green,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            resultMessage,
                            style: const TextStyle(fontSize: 15),
                          ),
                        ),
                      ),
                    const SizedBox(height: 12),

                    // Botón para abrir modal de registro
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () => showWeightDialog(context),
                      child: Text(
                        'Registrar Peso',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
