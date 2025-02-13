import 'package:flutter/material.dart';
import 'screens/cadastro_jogador.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Torneio de Tênis de Mesa',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: CadastroJogadorScreen(),
    );
  }
}