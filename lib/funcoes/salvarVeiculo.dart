import 'package:flutter/material.dart';
import '../firebase/DaoFirestore.dart';

class AdicionarVeiculo extends StatefulWidget {
  @override
  _AdicionarVeiculoState createState() => _AdicionarVeiculoState();
}

class _AdicionarVeiculoState extends State<AdicionarVeiculo> {
  final _nomeController = TextEditingController();
  final _modeloController = TextEditingController();
  final _anoController = TextEditingController();
  final _placaController = TextEditingController();

  void _salvarVeiculo() async {
    try {
      await DaoFirestore.salvarVeiculo(
        nome: _nomeController.text,
        modelo: _modeloController.text,
        ano: _anoController.text,
        placa: _placaController.text,
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Veículo salvo com sucesso!")),
      );
      Navigator.pop(context); // Volta para a tela anterior
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Erro ao salvar veículo: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Adicionar Veículo')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nomeController,
              decoration: InputDecoration(labelText: 'Nome'),
            ),
            TextField(
              controller: _modeloController,
              decoration: InputDecoration(labelText: 'Modelo'),
            ),
            TextField(
              controller: _anoController,
              decoration: InputDecoration(labelText: 'Ano'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _placaController,
              decoration: InputDecoration(labelText: 'Placa'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _salvarVeiculo,
              child: Text('Salvar'),
            ),
          ],
        ),
      ),
    );
  }
}