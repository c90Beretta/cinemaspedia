import 'package:cinepedia/config/domain/entities/movie.dart';
import 'package:cinepedia/presentation/widgets/movies/MoviePosterLink.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';


class MovieMansonry extends StatefulWidget {

  final List<Movie> movies;
  final VoidCallback? loadNextPage;

  const MovieMansonry({
  super.key, 
  required this.movies, 
   this.loadNextPage, 
  
   });
   

  @override
  State<MovieMansonry> createState() => _MovieMansonryState();
 
}

class _MovieMansonryState extends State<MovieMansonry> {

  final ScrollController loadNextPage = ScrollController();


   @override
  void initState() {
    super.initState();

    loadNextPage.addListener(() {
      
      if (loadNextPage.position.pixels >= (loadNextPage.position.maxScrollExtent - 150)) {
        widget.loadNextPage?.call();
      }
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
      child: MasonryGridView.count(
        controller: loadNextPage,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(10),
        crossAxisCount: 3,
        mainAxisSpacing: 15,
        crossAxisSpacing: 15,
        itemCount: widget.movies.length,
        itemBuilder: (context, index) {
          final movie = widget.movies[index];
          if( index == 1){
            return Padding(
              padding: const EdgeInsets.only(top: 60),
              child: MoviePosterLink(movie: movie));
          } 
          return 
          MoviePosterLink(movie: movie);

        }
        
      ),
    );
  }
}