import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GruposScreen extends StatefulWidget {
  @override
  _GruposScreenState createState() => _GruposScreenState();
}

class _GruposScreenState extends State<GruposScreen> {
  List<dynamic> grupos = [];
  bool isLoading = true;

  Future<void> _carregarGrupos() async {
    final response = await http.get(Uri.parse('http://localhost:5000/api/jogadores/grupos?numGrupos=4'));
    if (response.statusCode == 200) {
      setState(() {
        grupos = json.decode(response.body);
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao carregar grupos')),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _carregarGrupos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Grupos')),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: grupos.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    children: [
                      Text('Grupo ${index + 1}', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      ...grupos[index].map((jogador) {
                        return ListTile(
                          title: Text(jogador['nome']),
                          subtitle: Text('Ranking: ${jogador['ranking']}'),
                        );
                      }).toList(),
                    ],
                  ),
                );
              },
            ),
    );
  }
}