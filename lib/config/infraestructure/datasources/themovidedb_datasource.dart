import 'package:cinepedia/config/constants/enviroment.dart';
import 'package:cinepedia/config/domain/entities/movie.dart';
import 'package:cinepedia/config/domain/datasource/movie_datasource.dart';
import 'package:cinepedia/config/infraestructure/models/moviedb/moviedb_response.dart';
import 'package:cinepedia/config/infraestructure/mapers/movie_maper.dart';
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

    final response = await dio.get('/movie/now_playing', 
    queryParameters: {
      'page': page
    }); 

    final movieDBResponse = MovieDbResponse.fromJson(response.data);

    final  List<Movie> movies = movieDBResponse.results
    .where((moviedb) => moviedb.posterPath != 'No-Poster')
    .map((moviedb) => MovieMapper.movieDBtoEntity(moviedb))
    .toList();
    
    return movies;
  }
}
