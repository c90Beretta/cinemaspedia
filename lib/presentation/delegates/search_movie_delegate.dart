


import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:cinepedia/config/domain/entities/movie.dart';
import 'package:flutter/material.dart';



typedef SearchMovieCallBack = Future<List<Movie>> Function(String query);

class SearchMovieDelegate extends SearchDelegate<Movie?>{
  final SearchMovieCallBack searchMovieCallBack;
  StreamController<List<Movie>> debounceMovies = StreamController.broadcast();
  Timer? _debounceTimer;

  


  SearchMovieDelegate( {required this.searchMovieCallBack});

    void clearStreams(){
        debounceMovies.close();
    }

  void _onQueryChange(String query){
        print("Actualizacion de Query");
    if(_debounceTimer?.isActive ?? false) _debounceTimer!.cancel();

      _debounceTimer = Timer(const Duration(milliseconds: 600), () async {
        if(query.isEmpty){ debounceMovies.add([]);}
          final movies = await searchMovieCallBack(query);
            debounceMovies.add(movies);
        },
      );
    
  }



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
            //Eliminar El Buscador
          }),
        )
      ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return 
        IconButton(icon: const Icon(Icons.arrow_back_ios_rounded) ,
        onPressed: (){
        debounceMovies.close();
        //terminar el debounce
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
    _onQueryChange(query);
    return StreamBuilder(
      stream: debounceMovies.stream,
      // future: searchMovieCallBack(query),  
      builder: (context, snapshot) {
        final movies = snapshot.data?? [];


        if(movies.isEmpty){
          return const Center(child: Text("No hay resultados"),);
        }

        
        return ListView.builder(
          itemCount: movies.length,
          itemBuilder: (context, index) {
            return _MovieItem(movie: movies[index], onMovieselected: close,);
          },
          
          );
      },
      );
        
  }
}



class _MovieItem extends StatelessWidget {
  
  final Movie movie;
  final Function onMovieselected;

  const _MovieItem({ required this.movie, required this.onMovieselected});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textStyle = Theme.of(context).textTheme;
  
    return  GestureDetector(
        onTap: () {
           onMovieselected(context, movie );
        },
        child: Padding(
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
                  (movie.overview.length > 150) 
                  ? Text('${movie.overview.substring(0, 150)}...', style: textStyle.bodySmall)
                  : Text(movie.overview, style: textStyle.bodySmall),
                  Row(
                    children: [
      
                      Icon(Icons.star_half_rounded, color: Colors.yellow.shade900),
                      Text(movie.voteAverage.toString().substring(0,3), style: TextStyle(color:Colors.yellow.shade900),),
                    ],
                  )
                    
                  
              
                ],
              ),
            ),
          )
      
          ]
        ),
      
      ),
    );
  }
} 