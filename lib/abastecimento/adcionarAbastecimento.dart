import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdicionarAbastecimento extends StatefulWidget {
  final String veiculoId; // ID do veículo selecionado
  AdicionarAbastecimento({required this.veiculoId});

  @override
  _AdicionarAbastecimentoState createState() => _AdicionarAbastecimentoState();
}

class _AdicionarAbastecimentoState extends State<AdicionarAbastecimento> {
  final _litrosController = TextEditingController();
  final _kmController = TextEditingController();

  void _salvarAbastecimento() async {
    await FirebaseFirestore.instance
        .collection('veiculos')
        .doc(widget.veiculoId)
        .collection('abastecimentos')
        .add({
      'litros': double.parse(_litrosController.text),
      'km': int.parse(_kmController.text),
      'data': DateTime.now(),
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Adicionar Abastecimento')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _litrosController,
              decoration: InputDecoration(labelText: 'Litros'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _kmController,
              decoration: InputDecoration(labelText: 'Quilometragem'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _salvarAbastecimento,
              child: Text('Salvar'),
            ),
          ],
        ),
      ),
    );
  }
}