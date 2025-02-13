import 'package:flutter/material.dart';
import 'screens/cadastro_jogador.dart';
import 'screens/grupos_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Torneio de Tênis de Mesa',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0; // Índice da tela atual

  // Lista de telas do app
  final List<Widget> _telas = [
    CadastroJogadorScreen(),
    GruposScreen(),
  ];

  // Função para atualizar o índice da tela
  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _telas[_currentIndex], // Exibe a tela atual
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex, // Índice da tela ativa
        onTap: _onItemTapped, // Função chamada ao tocar em um ícone
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person_add),
            label: 'Cadastrar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: 'Grupos',
          ),
        ],
      ),
    );
  }
}