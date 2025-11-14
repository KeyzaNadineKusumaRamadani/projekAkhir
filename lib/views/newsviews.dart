import 'package:flutter/material.dart';
import '../controlers/newsControllers.dart';
import '../widget/newsWidget.dart';

class Newsviews extends StatefulWidget {
  const Newsviews({super.key});

  @override
  State<Newsviews> createState() => _NewsviewsState();
}

class _NewsviewsState extends State<Newsviews> {
  NewsControllers newsController = NewsControllers();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 227, 228, 228),
      appBar: AppBar(
        title: const Text(
          "Berita Terbaru 📰",
          style: TextStyle(fontWeight: FontWeight.bold, color: Color.fromARGB(255, 243, 244, 243)),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 0, 50, 3),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: newsController.newsList.length,
        itemBuilder: (context, index) {
          return NewsWidget().newsCard(newsController.newsList[index]);
        },
      ),
    );
  }
}
