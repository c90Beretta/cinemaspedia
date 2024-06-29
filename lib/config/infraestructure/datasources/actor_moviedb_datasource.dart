


import 'package:cinepedia/config/domain/datasource/actors_datasource.dart';
import 'package:cinepedia/config/domain/entities/actor.dart';

class ActorMovieDbDatasource extends ActoresDatasource{
  @override
  Future<List<Actor>> getMovieActors(String movieID) async{

    return [];
  }

  
  
}