


import 'package:animate_do/animate_do.dart';
import 'package:cinepedia/config/domain/entities/movie.dart';
import 'package:flutter/material.dart';



typedef SearchMovieCallBack = Future<List<Movie>> Function(String query);

class SearchMovieDelegate extends SearchDelegate<Movie?>{
  final SearchMovieCallBack searchMovieCallBack;

  SearchMovieDelegate( {required this.searchMovieCallBack});
  @override
  String get searchFieldLabel => "Buscar Peliculas";


  @override
  List<Widget>? buildActions(BuildContext context) {
      return [
        FadeIn(
          animate: query.isNotEmpty,
          duration: const Duration(milliseconds: 200),
          child: IconButton(
          icon: const Icon(Icons.clear), 
          onPressed: (){
            query = "";
          }),
        )
      ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return 
        IconButton(icon: const Icon(Icons.arrow_back_ios_rounded) ,
        onPressed: (){
          close(context, null);
        }

        );
  }


  @override
  Widget buildResults(BuildContext context) {
    return 
        const Text("BUILD RESULTS");
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder(
      future: searchMovieCallBack(query), 
      builder: (context, snapshot) {
        final movies = snapshot.data?? [];
        return ListView.builder(
          itemCount: movies.length,
          itemBuilder: (context, index) {
            return _ListViewPelicula(movie: movies[index]);
          },
          
          );
      },
      );
        
  }
}


class _ListViewPelicula extends StatelessWidget {
  
  final Movie movie;

  const _ListViewPelicula({ required this.movie});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textStyle = Theme.of(context).textTheme;
  
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      child: Row(
        children:[
        //image
        SizedBox(
          width: size.width * 0.2,
          height: size.height * 0.2,

          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.network(
              movie.backdropPath,  
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) => 
                loadingProgress == null
                ? FadeIn(child: child)
                : const Center(child: CircularProgressIndicator(),),
            ),
          ),
        ),

        //descripcion
        Padding(
          padding: const EdgeInsets.all(14.0),
          child: SizedBox(
            width: size.width * 0.7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(movie.title, style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold) ,),
                const SizedBox(height: 5),
                Text(movie.overview, style: textStyle.bodySmall),
                // (movie.overview.length > 150) 
                // ? Text('${movie.overview.substring(0, 150)}...', style: textStyle.bodySmall)
                // : Text(movie.overview, style: textStyle.bodySmall),
                  
                
            
              ],
            ),
          ),
        )

        ]
      ),

    );
  }
}