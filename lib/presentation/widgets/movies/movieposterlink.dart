

// ignore_for_file: file_names

import 'package:animate_do/animate_do.dart';
import 'package:cinepedia/config/domain/entities/movie.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MoviePosterLink extends StatelessWidget {

  final Movie movie;

  const MoviePosterLink({
  super.key, 
  required this.movie

  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;


    return SizedBox(
      width: (size.width / 3) - 10,
      height: (size.height / 2.5) - 10,
      child: GestureDetector(
        onTap: () => context.push('/home/0/movie/${movie.id}'),
        child: FadeIn(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: [
                Image.network(
                  movie.posterPath,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    color: Colors.black.withOpacity(0.5),
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      movie.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            
          )
          ),
        ),
      ),
    );
  }
}