import 'package:cinepedia/config/constants/enviroment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        
        title: const Center(child:  Text('Prueba de Cinemapedia')),
      ),
      body:  Center(
        child: Text(Enviroment.theMoviedbKey),
      )
    );
  }
}