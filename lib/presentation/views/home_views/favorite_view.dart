import 'package:flutter/material.dart';


class FavoritesView extends StatelessWidget {
  static const name = '/favorites';
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Favorites view'),
        centerTitle: true,
      ),
      body: Center(
        child: const Text('Favoritos'),
      ),
    );
  }
}