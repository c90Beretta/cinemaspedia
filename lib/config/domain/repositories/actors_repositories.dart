

import 'package:cinepedia/config/domain/entities/actor.dart';

abstract class ActoresDatasource{
  Future<List<Actor>> getMovieActors( String movieID);
}