


import 'package:cinepedia/config/domain/entities/movie.dart';

abstract class LocalStorageDatasource {

    Future<void> toggleFavorite(Movie movie );
    Future<bool> isMovieFavorite(int movieid );
    Future<List<Movie>> loadMovies({int limit = 10, offset = 0 });

  // Future<void> saveData(String key, dynamic value);
  // Future<dynamic> getData(String key);
  // Future<void> deleteData(String key);
  // Future<void> clearData();
}