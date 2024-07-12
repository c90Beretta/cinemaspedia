import 'package:cinepedia/config/domain/entities/movie.dart';
import 'package:cinepedia/presentation/delegates/search_movie_delegate.dart';
import 'package:cinepedia/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';


class CustomAPPBar extends ConsumerWidget {
  const CustomAPPBar({super.key});

  @override
  Widget build(BuildContext context, ref) {

    final colors = Theme.of(context).colorScheme;
    final titleStyle = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    return  SafeArea(
      bottom: false,
      child: SizedBox(
        height: size.height * .15,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(width: 10),
            Icon(Icons.movie_outlined, color: colors.primary, weight: 40, ),
            const SizedBox(width: 10),
            Text('Cinepedia', style: titleStyle.headlineLarge, ),
            
            
            const Spacer(),
            
            IconButton (
            onPressed: () {
             final searchQuery = ref.read(searchQueryProvider);     
             
             showSearch<Movie?>(
              query: searchQuery,
              context:context, 
              delegate: SearchMovieDelegate(
                 searchMovieCallBack: ref.read(searchedMovieProvider.notifier).searchMoviebyQuery),
                ).then((movie) {
                  if(movie == null) return;
                  context.push('/movie/${movie.id}');

                });
    
            }, 
            icon:  Icon(Icons.search_rounded, color: colors.primary,
             ),
            ),
          ],
        ),
            
      ),
      
    );
  }
}