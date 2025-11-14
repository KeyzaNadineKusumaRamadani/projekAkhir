import 'package:databuah/views/fruitViews.dart';
import 'package:databuah/views/navbar_view.dart';
import 'package:flutter/material.dart' hide NavbarView;
import 'controlers/fruitControlers.dart';
import 'models/fruitModels.dart';
import 'widget/splashScreen.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Penjualan Buah',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: '/splash',
      routes: {
        '/': (context) => const NavbarView(),
        '/splash': (context) => const SplashView(
          
        ),
      },
    );
  }
}

