import 'package:cinepedia/config/domain/entities/movie.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final searchQueryProvider =  StateProvider<String> ((ref) => "");

// final searchedMovieProvider = StateNotifierProvider <SearchedMovieNotifier, state> ((ref) => null);


class SearchedMovieNotifier extends StateNotifier <List<Movie>>{


  SearchedMovieNotifier(): super([]);

  Future<List<Movie>> searchMoviebyQuery(String query) async{
    
    
    
     return [];
  }



}