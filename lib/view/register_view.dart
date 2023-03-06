import 'package:fiap_newsapp/controller/register_controller.dart';
import 'package:fiap_newsapp/widgets/form_button.dart';
import 'package:fiap_newsapp/widgets/input_field.dart';
import 'package:fiap_newsapp/widgets/log_reg_changer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({required this.showLoginView, super.key});
  final VoidCallback showLoginView;

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  @override
  Widget build(BuildContext context) {
    final regController = Get.put(RegisterController());
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/news.png',
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 60),
                Text(
                  'Cadastro',
                  style: GoogleFonts.poppins(
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.bold,
                    fontSize: 36,
                  ),
                ),
                Text(
                  'Cadastre-se para continuar',
                  style: GoogleFonts.raleway(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 20),
                InputField(
                  controller: regController.emailController,
                  hintText: 'Digite seu email',
                  obscureText: false,
                  prefixIcon: Icons.email,
                ),
                const SizedBox(height: 20),
                InputField(
                  controller: regController.passwordController,
                  hintText: 'Senha',
                  obscureText: true,
                  prefixIcon: Icons.password_outlined,
                ),
                const SizedBox(height: 20),
                InputField(
                  controller: regController.confirmPasswordController,
                  hintText: 'Confirmar Senha',
                  obscureText: true,
                  prefixIcon: Icons.password_outlined,
                ),
                const SizedBox(height: 20),
                FormButton(
                  onTap: () => regController.signUp(context),
                  text: 'Cadastrar',
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Ja possui cadastro?',
                      style: GoogleFonts.raleway(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    LogRegChanger(
                      onTap: widget.showLoginView,
                      text: 'Fazer Login',
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
