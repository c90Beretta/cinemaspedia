

import 'package:cinepedia/config/domain/datasource/local_storage_datasource.dart';
import 'package:cinepedia/config/domain/entities/movie.dart';
import 'package:cinepedia/config/domain/repositories/local_storage_datasource.dart';

class LocalStorageRepositoryImplementation extends LocalStorageRepository{

  final LocalStorageDatasource dataSource;

  LocalStorageRepositoryImplementation(this.dataSource);



  @override
  Future<bool> isMovieFavorite(int movieid) {
    return dataSource.isMovieFavorite(movieid);
  }

  @override
  Future<List<Movie>> loadMovies({int limit = 10, offset = 0}) {
    return dataSource.loadMovies(limit: limit, offset: offset);
  }

  @override
  Future<void> toggleFavorite(Movie movie) {
   return dataSource.toggleFavorite(movie);
  }

}

