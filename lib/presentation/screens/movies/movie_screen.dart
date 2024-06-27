import 'package:flutter/material.dart';


class MovieScreen extends StatelessWidget {
  static const String routeName = '/movie';
  final String movieId;


  const MovieScreen({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( 
        title: Text('Movieid: $movieId'),

      ),
    );
  }
}