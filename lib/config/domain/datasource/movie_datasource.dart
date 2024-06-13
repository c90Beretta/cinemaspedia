
import 'package:cinepedia/config/domain/entities/movie.dart';

abstract class MoviesDataSource {

  Future<List<Movie>> getNowPlaying({int page = 1});
  
}