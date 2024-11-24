import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'funcoes/adcionarVeiculo.dart';
import 'funcoes/listaVeiculos.dart';
import 'login.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isLoading = false;

  void _logout() async {
    setState(() {
      _isLoading = true;
    });
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Login()),
    );
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tela Principal"),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(
                "Usuário",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              accountEmail: Text(
                FirebaseAuth.instance.currentUser?.email ?? "email@example.com",
                style: TextStyle(fontSize: 16),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.person,
                  size: 40,
                  color: Colors.indigo,
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.indigo,
              ),
            ),
            ListTile(
              leading: Icon(Icons.directions_car, color: Colors.indigo),
              title: Text("Meus Veículos"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ListaVeiculos()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.add, color: Colors.indigo),
              title: Text("Adicionar Veículo"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AdicionarVeiculo()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.person, color: Colors.indigo),
              title: Text("Perfil"),
              onTap: () {
                // Navegar para a tela de Perfil
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.logout, color: Colors.red),
              title: Text("Logout"),
              onTap: _isLoading
                  ? null
                  : () {
                _logout();
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: _isLoading
            ? CircularProgressIndicator()
            : Text(
          "Bem-vindo à Tela Principal!",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
