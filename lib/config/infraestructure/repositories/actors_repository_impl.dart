


import 'package:cinepedia/config/domain/entities/actor.dart';
import 'package:cinepedia/config/domain/repositories/actors_repositories.dart';
import 'package:cinepedia/config/infraestructure/datasources/actor_moviedb_datasource.dart';

class ActorRepositoryImplementation extends ActoresDatasource{

  final ActorMovieDbDatasource dataSource;

  ActorRepositoryImplementation(this.dataSource);

  @override
  Future<List<Actor>> getMovieActors(String movieID) {
    return dataSource.getMovieActors(movieID);
  }


}