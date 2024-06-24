
import 'package:cinepedia/config/domain/entities/movie.dart';
import 'package:cinepedia/presentation/providers/movies/movies_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

  final nowPlayingMoviesProvider = StateNotifierProvider<MoviesNotifier,List<Movie>>((ref)  { 
  final fetchMoreMovies = ref.watch(movieRepositoryProvider).getNowPlaying;
  return MoviesNotifier(
    fetchMoreMovies: fetchMoreMovies
  );
  }
  );  
  final popularMoviesProvider = StateNotifierProvider<MoviesNotifier,List<Movie>>((ref)  { 
  final fetchMoreMovies = ref.watch(movieRepositoryProvider).getPopular;
  return MoviesNotifier(
    fetchMoreMovies: fetchMoreMovies
  );
  }
  ); 
   final topRatedMoviesProvider = StateNotifierProvider<MoviesNotifier,List<Movie>>((ref)  { 
  final fetchMoreMovies = ref.watch(movieRepositoryProvider).getTopRated;
  return MoviesNotifier(
    fetchMoreMovies: fetchMoreMovies
  );
  }
  );

 final getUpComingMoviesProvider = StateNotifierProvider<MoviesNotifier,List<Movie>>((ref)  { 
  final fetchMoreMovies = ref.watch(movieRepositoryProvider).getUpcoming;
  return MoviesNotifier(
    fetchMoreMovies: fetchMoreMovies
  );
  }
  );




typedef MovieCallBack = Future <List<Movie>> Function({int page});


class MoviesNotifier extends StateNotifier <List<Movie>>{
  int currentPage = 0;
  bool _isLoading = false;
  MovieCallBack fetchMoreMovies;

  MoviesNotifier({
    required this.fetchMoreMovies,
  }): super ([]);

  Future <void> loadNextPage() async {

    if(_isLoading) return;

    currentPage++;

    final List<Movie> movies = await fetchMoreMovies(page: currentPage);
    state = [...state, ...movies];
    await Future.delayed(const Duration(milliseconds: 200));
    _isLoading = false;
    
  }

}