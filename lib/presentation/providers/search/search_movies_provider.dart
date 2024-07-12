import 'package:cinepedia/config/domain/entities/movie.dart';
import 'package:cinepedia/presentation/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final searchQueryProvider =  StateProvider<String> ((ref) => "");
//State Simple




//? Cache: StateNotifierProvider necesita NotifierProvider(SearchedMovieNotifier)
final searchedMovieProvider = StateNotifierProvider <SearchedMovieNotifier, List<Movie>> ((ref) {

 //*referencia a SearchMovies desde nuestro Datasource
 final movieRepository = ref.read(movieRepositoryProvider);

  return SearchedMovieNotifier(ref,
   searchMovies: movieRepository.searchMovie);

});


//*Definir Callback
typedef SearchMoviesCallback  =Future<List<Movie>> Function (String query);

//? State Notifier para Provider
class SearchedMovieNotifier extends StateNotifier <List<Movie>>{
  
   final SearchMoviesCallback searchMovies;
   final Ref ref;

  SearchedMovieNotifier(this.ref, {
      required this.searchMovies,
    }): super([]);


  Future<List<Movie>> searchMoviebyQuery(String query) async{
    final List<Movie> movies = await searchMovies(query);
    ref.read(searchQueryProvider.notifier).update((state) => query);
      state = movies;
     return movies;
  }



}