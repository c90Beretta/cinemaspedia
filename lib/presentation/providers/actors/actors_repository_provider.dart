


import 'package:cinepedia/config/infraestructure/datasources/actor_moviedb_datasource.dart';
import 'package:cinepedia/config/infraestructure/repositories/actors_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final actorsRepositoryProvider = Provider((ref) {
  return ActorRepositoryImplementation((ActorMovieDbDatasource()));
});