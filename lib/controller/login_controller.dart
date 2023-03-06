import 'package:fiap_newsapp/widgets/snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<dynamic> signIn(BuildContext context) async {
    if (emailController.text.isNotEmpty & passwordController.text.isNotEmpty) {
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );

        if (context.mounted) {
          emailController.clear();
          passwordController.clear();
          
          ModSnackBar(
            context,
            'Bem-vindo!',
            backgroundColor: Colors.lightGreen,
          );
        }
      } on FirebaseAuthException catch (err) {
        if (err.code == 'user-not-found') {
          ModSnackBar(
            context,
            'Usuário não encontrado',
            backgroundColor: Colors.red,
          );
        } else if (err.code == 'wrong-password') {
          ModSnackBar(
            context,
            'Senha incorreta',
            backgroundColor: Colors.red,
          );
        } else if (err.code == 'invalid-email') {
          ModSnackBar(
            context,
            'Email incorreto',
            backgroundColor: Colors.red,
          );
        } else {
          ModSnackBar(
            context,
            'Erro desconhecido',
            backgroundColor: Colors.red,
          );
        }
      }
    } else {
      ModSnackBar(
        context,
        'Preencha todos os campos para continuar',
        backgroundColor: Colors.red,
      );
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
