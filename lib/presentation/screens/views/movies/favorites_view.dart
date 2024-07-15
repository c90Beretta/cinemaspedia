

import 'package:cinepedia/presentation/widgets/shared/app_loader.dart';
import 'package:flutter/material.dart';

class FavoritesView extends StatelessWidget {
  static const name = 'FavoritesView';

  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: const 
      Center(
          child: AppLoader(),
      ),
    );
  }
}