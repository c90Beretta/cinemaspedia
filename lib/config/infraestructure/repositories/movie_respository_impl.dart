
import 'package:cinepedia/config/domain/datasource/movie_datasource.dart';
import 'package:cinepedia/config/domain/entities/movie.dart';
import 'package:cinepedia/config/domain/repositories/movie_repositorie.dart';

class MovieRespositoryImplementation extends MovieRepository {

  final MoviesDataSource dataSource;
  
  MovieRespositoryImplementation({required this.dataSource});
  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {
    return dataSource.getNowPlaying(page: page);
  }

  @override
  Future<List<Movie>> getPopular({int page = 1}) {
      return dataSource.getPopular(page: page);
  }
  
  @override
  Future<List<Movie>> getTopRated({int page = 1}) {
    return dataSource.getTopRated(page: page);
  }
  
  @override
  Future<List<Movie>> getUpcoming({int page = 1}) {
    return dataSource.getUpcoming(page: page);
  }
  
  @override
  Future<Movie> getMovieByID(String id) {
    return dataSource.getMovieByID(id);
  }
  
  @override
  Future<List<Movie>> searchMovie(String query) {
    return dataSource.searchMovie(query);
  }


}