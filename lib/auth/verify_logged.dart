import 'package:fiap_newsapp/auth/access_router.dart';
import 'package:fiap_newsapp/view/news_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class VerifyAlreadyLogged extends StatelessWidget {
  const VerifyAlreadyLogged({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return NewsView();
          } else {
            return const AccessRouter();
          }
        },
      ),
    );
  }
}
