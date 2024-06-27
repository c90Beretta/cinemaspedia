import 'package:cinepedia/config/constants/enviroment.dart';
import 'package:cinepedia/config/domain/entities/movie.dart';
import 'package:cinepedia/config/domain/datasource/movie_datasource.dart';
import 'package:cinepedia/config/infraestructure/models/moviedb/movie_details.dart';
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


      List<Movie> _jsonToMovie(Map<String, dynamic> json){
         final movieDBResponse = MovieDbResponse.fromJson(json);

    final  List<Movie> movies = movieDBResponse.results
    .where((moviedb) => moviedb.posterPath != 'No-Poster')
    .map((moviedb) => MovieMapper.movieDBtoEntity(moviedb))
    .toList();
     
    return movies;

      }

    

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {

    final response = await dio.get('/movie/now_playing', 
    queryParameters: {
      'page': page
    }); 

    return _jsonToMovie(response.data); 
  }
  
  @override
  Future<List<Movie>> getPopular({int page = 1}) async {
   final response = await dio.get('/movie/popular', 
    queryParameters: {
      'page': page
    }); 

    return _jsonToMovie(response.data);

   
  }
  
  @override
  Future<List<Movie>> getTopRated({int page = 1}) async {
    final response = await dio.get('/movie/top_rated', 
    queryParameters: {
      'page': page
    }); 

    return _jsonToMovie(response.data);

  }
  
  @override
  Future<List<Movie>> getUpcoming({int page = 1}) async {
    final response = await dio.get('/movie/upcoming', 
    queryParameters: {
      'page': page
    }); 

    return _jsonToMovie(response.data);
  }
  
  @override
  Future<Movie> getMovieByID(String id) async {

    final response = await dio.get('/movie/$id',);

    if (response.statusCode != 200) {
      throw Exception('Error al obtener la pelicula ID: $id')
     ;
    }
  
        final movieDetails = MovieDetails.fromJson(response.data);

        final Movie movie = MovieMapper.movieDetailstoEntity(movieDetails);

        return movie;



  }
}
