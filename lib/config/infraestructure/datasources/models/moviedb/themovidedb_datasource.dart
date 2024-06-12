import 'package:cinepedia/config/constants/enviroment.dart';
import 'package:cinepedia/config/entities/movie.dart';
import 'package:cinepedia/config/datasource/movie_datasource.dart';
import 'package:dio/dio.dart';

class MovieDBDatasource extends MoviesDataSource {
  final dio = Dio(BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Enviroment.theMoviedbKey,
        'language': 'es-MX'
      }
      )
      );

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {

    final response = await dio.get('/movie/now_playing'); 
    final  List<Movie> movies = [];
    
    return [];
  }
}
