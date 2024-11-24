import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AdicionarVeiculo extends StatefulWidget {
  @override
  _AdicionarVeiculoState createState() => _AdicionarVeiculoState();
}

class _AdicionarVeiculoState extends State<AdicionarVeiculo> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _modeloController = TextEditingController();
  final TextEditingController _placaController = TextEditingController();
  final TextEditingController _anoController = TextEditingController();

  void _addVeiculo() async {
    final nome = _nomeController.text;
    final modelo = _modeloController.text;
    final placa = _placaController.text;
    final ano = _anoController.text;

    if (nome.isEmpty || modelo.isEmpty || placa.isEmpty || ano.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Por favor, preencha todos os campos')),
      );
      return;
    }

    // Adiciona o veículo no Firestore
    await _firestore.collection('veiculos').add({
      'nome': nome,
      'modelo': modelo,
      'placa': placa,
      'ano': ano,
    });

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Adicionar Veículo"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _nomeController,
              decoration: InputDecoration(labelText: "Nome do Veículo"),
            ),
            TextField(
              controller: _modeloController,
              decoration: InputDecoration(labelText: "Modelo do Veículo"),
            ),
            TextField(
              controller: _placaController,
              decoration: InputDecoration(labelText: "Placa do Veículo"),
            ),
            TextField(
              controller: _anoController,
              decoration: InputDecoration(labelText: "Ano do Veículo"),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _addVeiculo,
              child: Text('Adicionar'),
            ),
          ],
        ),
      ),
    );
  }
}