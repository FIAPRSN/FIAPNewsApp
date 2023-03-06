import 'package:fiap_newsapp/view/login_view.dart';
import 'package:fiap_newsapp/view/register_view.dart';
import 'package:flutter/material.dart';

class AccessRouter extends StatefulWidget {
  const AccessRouter({super.key});

  @override
  State<AccessRouter> createState() => _AccessRouterState();
}

class _AccessRouterState extends State<AccessRouter> {
  bool showLoginView = true;

  void changeScreens() {
    setState(() {
      showLoginView = !showLoginView;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginView) {
      return LoginView(showRegisterView: changeScreens);
    } else {
      return RegisterView(showLoginView: changeScreens);
    }
  }
}
