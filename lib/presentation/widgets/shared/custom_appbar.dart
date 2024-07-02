import 'package:cinepedia/presentation/delegates/search_movie_delegate.dart';
import 'package:cinepedia/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class CustomAPPBar extends ConsumerWidget {
  const CustomAPPBar({super.key});

  @override
  Widget build(BuildContext context, ref) {

    final colors = Theme.of(context).colorScheme;
    final titleStyle = Theme.of(context).textTheme.titleMedium;

    return  SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        child: SizedBox(
          width: double.infinity,
          child: Row(
            children: [
              Icon(Icons.movie_outlined, color: colors.primary ),
              const SizedBox(width: 10),
              Text('Cinepedia', style: titleStyle,),
      
      
              const Spacer(),
      
      
              IconButton(
              onPressed: (){
                final movierepository = ref.read(movieRepositoryProvider);
                 
                showSearch(
                context:context, 
                delegate: SearchMovieDelegate(
                  searchMovieCallBack: movierepository.searchMovie),);
              }, 
              icon:  Icon(Icons.search_rounded, color: colors.primary),
              
              ),
            ],
          ),
      
        ),
      ),
      
    );
  }
}