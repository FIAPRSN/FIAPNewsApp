import 'package:fiap_newsapp/controller/login_controller.dart';
import 'package:fiap_newsapp/widgets/form_button.dart';
import 'package:fiap_newsapp/widgets/input_field.dart';
import 'package:fiap_newsapp/widgets/log_reg_changer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginView extends StatefulWidget {
  const LoginView({required this.showRegisterView, super.key});
  final VoidCallback showRegisterView;

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    final logController = Get.put(LoginController());
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  'assets/images/news.png',
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 60),
                Text(
                  'Login',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey,
                    fontSize: 36,
                  ),
                ),
                Text(
                  'Digite usuário e senha para prosseguir',
                  style: GoogleFonts.raleway(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 20),
                InputField(
                  controller: logController.emailController,
                  hintText: 'Digite seu email',
                  obscureText: false,
                  prefixIcon: Icons.email,
                ),
                const SizedBox(height: 20),
                InputField(
                  controller: logController.passwordController,
                  hintText: 'Digite sua senha',
                  obscureText: true,
                  prefixIcon: Icons.password_outlined,
                ),
                const SizedBox(height: 20),
                FormButton(
                  onTap: () => logController.signIn(context),
                  text: 'Entrar',
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Ainda não registrado?',
                      style: GoogleFonts.raleway(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    LogRegChanger(
                      onTap: widget.showRegisterView,
                      text: 'Cadastrar',
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
