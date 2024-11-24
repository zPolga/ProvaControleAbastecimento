import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HistoricoAbastecimentos extends StatelessWidget {
  final String veiculoId;
  HistoricoAbastecimentos({required this.veiculoId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Histórico de Abastecimentos')),
        body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('veiculos')
              .doc(veiculoId)
              .collection('abastecimentos')
              .orderBy('data', descending: true)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) return Text("Erro ao carregar dados");
            if (snapshot.connectionState == ConnectionState.waiting)
              return CircularProgressIndicator();

            final abastecimentos = snapshot.data!.docs;

            return ListView.builder(
              itemCount: abastecimentos.length,
              itemBuilder: (context, index) {
                var data = abastecimentos[index].data() as Map<String, dynamic>;
                return ListTile(
                  title: Text("Litros: ${data['litros']}"),
                  subtitle: Text("KM: ${data['km']}"),
                  trailing: Text(data['data'].toDate().toString()),
                );
              },
            );
          },
        )
    );
  }
}