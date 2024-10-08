import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Text('Determinador de Fase da Vida'),
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

  // Função para determinar a fase da vida
  String determinarFaseDaVida(int idade) {
    if (idade < 3) {
      return "Infância";
    } else if (idade >= 3 && idade <= 12) {
      return "Pré-adolescência";
    } else if (idade >= 13 && idade <= 19) {
      return "Adolescência";
    } else if (idade >= 20 && idade <= 35) {
      return "Juventude";
    } else if (idade >= 36 && idade <= 55) {
      return "Meia-idade";
    } else {
      return "Terceira idade";
    }
  }

  // Função para tratar o clique do botão
  void _calcularFaseDaVida() {
    setState(() {
      erro = '';
      resultado = '';
      int? idade = int.tryParse(controller.text);

      if (idade == null || idade < 0) {
        erro = 'Por favor, insira uma idade válida';
      } else {
        resultado = determinarFaseDaVida(idade);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Determinador de Fase da Vida'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: controller,
                decoration: InputDecoration(
                  labelText: 'Digite sua idade',
                  errorText: erro.isEmpty ? null : erro,
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _calcularFaseDaVida,
                child: const Text('Calcular Fase da Vida'),
              ),
              const SizedBox(height: 20),
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
    );
  }
}
