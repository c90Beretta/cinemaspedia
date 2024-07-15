
import 'package:cinepedia/presentation/widgets/shared/app_loader.dart';
import 'package:flutter/material.dart';

class CategoriaView extends StatelessWidget {
  const CategoriaView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categorias'),
      ),
      body: const Column(
        children: [ 
          AppLoader(),
          Text('Categorias on Work! 😩😩😩')
        ]
      ),
    );
  }
}