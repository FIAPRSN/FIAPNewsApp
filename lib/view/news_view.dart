import 'package:fiap_newsapp/controller/news_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsView extends StatelessWidget {
  NewsView({super.key});

  final NewsController _newsController = Get.put(NewsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'News',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
            icon: const Icon(Icons.logout_rounded),
          ),
        ],
      ),
      body: Obx(
        () => _newsController.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: _newsController.news.length,
                itemBuilder: (context, index) {
                  final news = _newsController.news[index];

                  return Container(
                    margin: const EdgeInsets.all(5),
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: const Color.fromRGBO(205, 213, 223, 1),
                      ),
                    ),
                    child: GestureDetector(
                      onTap: () async {
                        await launchUrl(
                          Uri.parse(
                            news.url.toString(),
                          ),
                          mode: LaunchMode.externalApplication,
                        );
                      },
                      child: Card(
                        color: Colors.transparent,
                        elevation: 0,
                        child: Column(
                          children: [
                            Text(
                              news.title.toString(),
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 15),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                news.urlToImage.toString(),
                                errorBuilder: (context, exception, stackTrace) {
                                  return const Text('Imagem indisponivel');
                                },
                              ),
                            ),
                            const SizedBox(height: 15),
                            Text(
                              news.description.toString() == 'null'
                                  ? 'Sem Descrição'
                                  : news.description.toString(),
                              textAlign: TextAlign.justify,
                              style: GoogleFonts.poppins(),
                            ),
                            const SizedBox(height: 15),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
