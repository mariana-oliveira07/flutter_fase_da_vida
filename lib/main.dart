import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: ('Fase da Vida'),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController controller = TextEditingController();
  String resultado = '';
  String erro = '';

 determinarFaseDaVida() {
    double idade = double.parse(idadeController.text);

    if (idade <= 3) {
      resultado = 'Infância';
    } else if (idade <= 12) {
      resultado = 'Pré-adolescência';
    } else if (idade <= 19) {
      resultvida = 'Adolescência';
    } else if (idade <= 35) {
      resultado = 'Juventude';
    } else if (idade <= 55) {
      resultado = 'Meia-idade';
    } else if (idade <= 130) {
      resultado = 'Terceira idade';
    } else {
      resultvida = 'Idade Iválida';
    }

  void calcularFaseDaVida() {
    setState(() {
      erro = '';
      String input = controller.text.trim();
      if (input.isEmpty) {
        erro = 'Por favor, insira sua idade';
        resultado = '';
      } else {
        int idade = int.parse(input);
        if (idade > 116) {
          erro = 'A idade máxima permitida é 116 anos';
          resultado = '';
        } else {
          determinarFaseDaVida(idade);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Fase da Vida",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          centerTitle: true,
        ),
        body: Center(
          child: ConstrainedBox(
            constraints:
                const BoxConstraints(maxWidth: 300), // Largura máxima de 300
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextField(
                      controller: controller,
                      decoration: InputDecoration(
                        labelText: 'Digite sua idade',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      onSubmitted: (value) => determinarFaseDaVida),
                  const SizedBox(height: 6),
                  ElevatedButton(
                    onPressed: calcularFaseDaVida,
                    child: const Text('Calcular Fase da Vida'),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    resultado,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
