
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


}