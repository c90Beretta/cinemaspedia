import 'package:flutter/material.dart';

class CategoriasViews extends StatelessWidget {
  static const String name = 'categorias';
  const CategoriasViews({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Categorias Screen'),
        centerTitle: true,
      
      ),
      body: const Center(
      child: Text("Vista de la pantalla de Categorias"),

      ),
    );
  }
}