import 'package:cinepedia/presentation/widgets/app_loader.dart';
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
      child: AppLoader(mensaje: 'Categorias on the work!',),

      ),
    );
  }
}