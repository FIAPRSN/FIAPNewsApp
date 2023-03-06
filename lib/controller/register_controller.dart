import 'package:fiap_newsapp/widgets/snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  Future<dynamic> signUp(BuildContext context) async {
    if (passwordConfirmed() &
        emailController.text.isNotEmpty &
        passwordController.text.isNotEmpty) {
      try {
        ModSnackBar(
          context,
          'Verificando dados e iniciando cadastro...',
          backgroundColor: Colors.lightBlue,
        );

        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );

        if (context.mounted) {
          emailController.clear();
          passwordController.clear();
          confirmPasswordController.clear();

          ModSnackBar(
            context,
            'Cadastrado com sucesso. Bem-vindo!',
            backgroundColor: Colors.green,
          );
        }
        
      } on FirebaseAuthException catch (err) {
        if (err.code == 'email-already-in-use') {
          ModSnackBar(
            context,
            'Email já utilizado',
            backgroundColor: Colors.red,
          );
        } else if (err.code == 'weak-password') {
          ModSnackBar(
            context,
            'Senha fraca (6 caracteres necessários)',
            backgroundColor: Colors.red,
          );
        } else if (err.code == 'invalid-email') {
          ModSnackBar(
            context,
            'Email inválido',
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
    } else if (!passwordConfirmed()) {
      ModSnackBar(
        context,
        'Senhas digitadas não são idênticas',
        backgroundColor: Colors.red,
      );
    } else {
      ModSnackBar(
        context,
        'Preencha todos os campos para continuar',
        backgroundColor: Colors.red,
      );
    }
  }

  bool passwordConfirmed() {
    if (passwordController.text.trim() ==
        confirmPasswordController.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}
