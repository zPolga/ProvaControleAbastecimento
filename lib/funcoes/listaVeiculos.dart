import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ListaVeiculos extends StatefulWidget {
  @override
  _ListaVeiculosState createState() => _ListaVeiculosState();
}

class _ListaVeiculosState extends State<ListaVeiculos> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late Future<List<Veiculo>> _veiculosFuture;

  @override
  void initState() {
    super.initState();
    _veiculosFuture = _fetchVeiculos();
  }

  // Função para buscar veículos do Firestore
  Future<List<Veiculo>> _fetchVeiculos() async {
    QuerySnapshot querySnapshot = await _firestore.collection('veiculos').get();
    List<Veiculo> veiculos = [];
    querySnapshot.docs.forEach((doc) {
      veiculos.add(Veiculo.fromFirestore(doc));
    });
    return veiculos;
  }

  // Função para deletar veículo
  void _deleteVeiculo(String veiculoId) async {
    await _firestore.collection('veiculos').doc(veiculoId).delete();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Veículo excluído com sucesso!')),
    );
    setState(() {
      _veiculosFuture = _fetchVeiculos(); // Atualiza a lista após exclusão
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meus Veículos"),
      ),
      body: FutureBuilder<List<Veiculo>>(
        future: _veiculosFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro: ${snapshot.error}'));
          } else if (snapshot.hasData && snapshot.data!.isEmpty) {
            return Center(child: Text('Nenhum veículo encontrado.'));
          }

          List<Veiculo> veiculos = snapshot.data!;

          return ListView.builder(
            itemCount: veiculos.length,
            itemBuilder: (context, index) {
              final veiculo = veiculos[index];
              return ListTile(
                title: Text(veiculo.nome),
                subtitle: Text('${veiculo.modelo} - Placa: ${veiculo.placa} | Ano: ${veiculo.ano}'),
                leading: Icon(Icons.directions_car),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => _deleteVeiculo(veiculo.id),
                ),
                onTap: () {
                  // Ação ao clicar no item
                },
              );
            },
          );
        },
      ),
    );
  }
}

class Veiculo {
  final String id;
  final String nome;
  final String modelo;
  final String ano;
  final String placa;

  Veiculo({
    required this.id,
    required this.nome,
    required this.modelo,
    required this.placa,
    required this.ano,
  });

  // Construtor para criar objeto de Veículo a partir do Firestore
  factory Veiculo.fromFirestore(DocumentSnapshot doc) {
    return Veiculo(
      id: doc.id,
      nome: doc['nome'] ?? '',
      modelo: doc['modelo'] ?? '',
      placa: doc['placa'] ?? '',
      ano: doc['ano'] ?? '',
    );
  }
}
