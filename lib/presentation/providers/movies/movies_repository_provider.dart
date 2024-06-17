

import 'package:cinepedia/config/infraestructure/datasources/themovidedb_datasource.dart';
import 'package:cinepedia/config/infraestructure/repositories/movie_respository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final movieRepositoryProvider = Provider((ref) {
  return MovieRespositoryImplementation(dataSource:MovieDBDatasource());
  

});

