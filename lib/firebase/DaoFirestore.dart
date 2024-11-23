import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DaoFirestore {
  static final FirebaseFirestore db = FirebaseFirestore.instance;
  static final FirebaseAuth auth = FirebaseAuth.instance;

  // Salva um novo veículo no Firestore
  static Future<void> salvarVeiculo({
    required String nome,
    required String modelo,
    required String ano,
    required String placa,
  }) async {
    String? userId = auth.currentUser?.uid;

    if (userId == null) {
      throw Exception("Usuário não autenticado.");
    }

    await db.collection('veiculos').add({
      'nome': nome,
      'modelo': modelo,
      'ano': ano,
      'placa': placa,
      'userId': userId,
    });
  }

  // Lista veículos do usuário atual
  static Stream<QuerySnapshot> listarVeiculos() {
    String? userId = auth.currentUser?.uid;

    if (userId == null) {
      throw Exception("Usuário não autenticado.");
    }

    return db
        .collection('veiculos')
        .where('userId', isEqualTo: userId)
        .snapshots();
  }
}