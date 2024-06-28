import 'package:cinepedia/presentation/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../config/domain/entities/movie.dart';

final movieInfoProvider = StateNotifierProvider<MovieMapNotifier,Map<String,Movie>>((ref) {
  final movieRepository = ref.watch(movieRepositoryProvider);
  return MovieMapNotifier(getMovie: movieRepository.getMovieByID);

});
  



/*  MAPA
  {
    '505642': Movie();  --- LLAMADO 
    '505642': Movie();  --- LLAMADO 
    '505642': Movie();  --- LLAMADO 
  }
*/ 








typedef GetMovieCallBack = Future<Movie> Function(String movieid);

class MovieMapNotifier extends StateNotifier <Map<String, Movie>>{
  final GetMovieCallBack getMovie;
  MovieMapNotifier( {required this.getMovie,}):super({});

  Future<void> loadMovie(String movieid) async{
    if( state[movieid] !=  null) return;
    final movie = await getMovie(movieid); 
    state = {...state, movieid: movie};
  }

}