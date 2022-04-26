import 'package:flutter/material.dart';

import 'home_screen.dart';
import 'cadastro_screen.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: const Color.fromARGB(255, 229, 9, 9),
    ),
    initialRoute: '/',
    routes: {
      '/': (context) => const HomeScreen(),
      'cadastro': (context) => CadastroScreen(),
    },
  ));
}
