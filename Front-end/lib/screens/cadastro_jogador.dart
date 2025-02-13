import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CadastroJogadorScreen extends StatefulWidget {
  @override
  _CadastroJogadorScreenState createState() => _CadastroJogadorScreenState();
}

class _CadastroJogadorScreenState extends State<CadastroJogadorScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nomeController = TextEditingController();
  final _idadeController = TextEditingController();
  final _rankingController = TextEditingController();
  final _clubeController = TextEditingController();

  Future<void> _cadastrarJogador() async {
    if (_formKey.currentState!.validate()) {
      final response = await http.post(
        Uri.parse('http://localhost:5000/api/jogadores'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'nome': _nomeController.text,
          'idade': int.parse(_idadeController.text),
          'ranking': int.parse(_rankingController.text),
          'clube': _clubeController.text,
        }),
      );

      if (response.statusCode == 201) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Jogador cadastrado com sucesso!')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro ao cadastrar jogador')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cadastrar Jogador')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nomeController,
                decoration: InputDecoration(labelText: 'Nome'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo obrigatório';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _idadeController,
                decoration: InputDecoration(labelText: 'Idade'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo obrigatório';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _rankingController,
                decoration: InputDecoration(labelText: 'Ranking'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo obrigatório';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _clubeController,
                decoration: InputDecoration(labelText: 'Clube'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _cadastrarJogador,
                child: Text('Cadastrar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}