import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MeusVeiculos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meus Veículos"),
      ),
      body: Center(
        child: Text("Lista de veículos cadastrados."),
      ),
    );
  }
}