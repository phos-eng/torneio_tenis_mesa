import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AgendamentoPartidasScreen extends StatefulWidget {
  @override
  _AgendamentoPartidasScreenState createState() => _AgendamentoPartidasScreenState();
}

class _AgendamentoPartidasScreenState extends State<AgendamentoPartidasScreen> {
  final _formKey = GlobalKey<FormState>();
  final _jogador1Controller = TextEditingController();
  final _jogador2Controller = TextEditingController();
  final _dataController = TextEditingController();
  final _mesaController = TextEditingController();

  Future<void> _agendarPartida() async {
    if (_formKey.currentState!.validate()) {
      final response = await http.post(
        Uri.parse('http://localhost:5000/api/partidas'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'jogador1_id': int.parse(_jogador1Controller.text),
          'jogador2_id': int.parse(_jogador2Controller.text),
          'data': _dataController.text,
          'mesa': int.parse(_mesaController.text),
        }),
      );

      if (response.statusCode == 201) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Partida agendada com sucesso!')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro ao agendar partida')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Agendar Partida')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _jogador1Controller,
                decoration: InputDecoration(labelText: 'ID do Jogador 1'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo obrigatório';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _jogador2Controller,
                decoration: InputDecoration(labelText: 'ID do Jogador 2'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo obrigatório';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _dataController,
                decoration: InputDecoration(labelText: 'Data (YYYY-MM-DD HH:MM)'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo obrigatório';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _mesaController,
                decoration: InputDecoration(labelText: 'Número da Mesa'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo obrigatório';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _agendarPartida,
                child: Text('Agendar Partida'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}