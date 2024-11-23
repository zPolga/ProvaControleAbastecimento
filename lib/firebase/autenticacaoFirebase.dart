import 'package:firebase_auth/firebase_auth.dart';

class AutenticacaoFirebase {
  Future<String> signInWithEmailPassword(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return "Usuário autenticado: ${userCredential.user!.uid}";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return "Usuário não encontrado";
      } else if (e.code == 'wrong-password') {
        return "Senha incorreta";
      }
      return "Erro de autenticação";
    }
  }

  Future<String> registerWithEmailPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return "Usuário registrado com sucesso: ${userCredential.user!.uid}";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return "A senha é muito fraca.";
      } else if (e.code == 'email-already-in-use') {
        return "A conta já existe para esse email.";
      }
      return "Erro de registro";
    } catch (e) {
      return "Erro: $e";
    }
  }

  Future<void> enviarEmailRecuperacaoSenha(String email) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }

  Future<bool> isUserLoggedIn() async {
    User? user = FirebaseAuth.instance.currentUser;
    return user != null;
  }
}
