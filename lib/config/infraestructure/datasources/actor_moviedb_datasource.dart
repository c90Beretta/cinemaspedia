


import 'package:cinepedia/config/domain/datasource/actors_datasource.dart';
import 'package:cinepedia/config/domain/entities/actor.dart';
import 'package:cinepedia/config/infraestructure/mapers/actor_maper.dart';
import 'package:cinepedia/config/infraestructure/models/moviedb/credits_response.dart';
import 'package:dio/dio.dart';
import 'package:cinepedia/config/constants/enviroment.dart';


class ActorMovieDbDatasource extends ActoresDatasource{
    final dio = Dio(BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3/movie',
      queryParameters: {
        'api_key': Enviroment.theMoviedbKey,
        'language': 'es-MX'
      }
      
      )
      );

  @override
  Future<List<Actor>> getMovieActors(String movieID) async{
    final response = await dio.get('/$movieID/credits');

    final castResponse = MovieDbActorsResponse.fromJson(response.data);

    List <Actor> actors = castResponse.cast.map(
      (cast) => ActorMapper.castToEntity(cast)).toList();

    return actors;
   
  }

  
  
}