import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        
        title: const Center(child:  Text('Prueba de Cinemapedia')),
      ),
      body: const Center(
        child: Text('Home Screen'),
      )
    );
  }
}