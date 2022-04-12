import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Calculo de IMC'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _pesoController = TextEditingController();
  final TextEditingController _alturaController = TextEditingController();
  String nomeImagem = "imagem_inicial";
  String cor = "blue";
  var _resultado = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculo de IMC"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(children: [
          Container(height: 200, child: Image.asset("images/$nomeImagem.jpg")),
          Container(
            margin: const EdgeInsets.only(top: 20),
            child: Text(
              _resultado,
              style: const TextStyle(
                fontSize: 30,
                color: Color.fromARGB(255, 91, 75, 75),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: TextField(
              controller: _pesoController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  labelText: "Peso",
                  prefix: Text("Kg"),
                  labelStyle: TextStyle(color: Colors.lightBlue, fontSize: 20)),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: TextField(
              controller: _alturaController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  labelText: "Altura",
                  prefix: Text("M"),
                  labelStyle: TextStyle(color: Colors.lightBlue, fontSize: 20)),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20),
            height: 50,
            width: 200,
            child: ElevatedButton(
                child: const Text(
                  "Calcular",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                style: ElevatedButton.styleFrom(primary: Colors.blue),
                onPressed: () {
                  double peso = double.parse(_pesoController.text);
                  double altura = double.parse(_alturaController.text);

                  double imc = peso / (altura * altura);
                  setState(() {
                    if (imc < 18.5) {
                      _resultado = "abaixo do peso";
                      nomeImagem = "imc_2";
                    } else if (imc < 24.9) {
                      _resultado = "Peso ideal (parabéns)";
                      nomeImagem = "imc_3";
                    } else if (imc < 29.9) {
                      _resultado = "Levemente acima do peso";
                      nomeImagem = "imc_4";
                    } else if (imc < 34.9) {
                      _resultado = "Obesidade grau I";
                      nomeImagem = "imc_5";
                    } else if (imc < 39.9) {
                      _resultado = "Obesidade grau II (severa)";
                      nomeImagem = "imc_6";
                    } else {
                      _resultado = "Obesidade III (morbida)";
                      nomeImagem = "imc_7";
                    }
                  });
                }),
          ),
        ]),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
