
import 'package:cinepedia/config/domain/entities/movie.dart';
import 'package:cinepedia/config/domain/repositories/local_storage_datasource.dart';
import 'package:cinepedia/presentation/providers/storage/local_storage_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


// // 
final favoritesMoviesProvider  = StateNotifierProvider <StorageMoviesNotifier,Map<int,Movie>>((ref) {
  final localStorageRepository = ref.watch(localStorageRepositoryProvider);
  return StorageMoviesNotifier(localStorageRepository: localStorageRepository);
});

class StorageMoviesNotifier extends StateNotifier <Map<int,Movie>>{

  int page =0;
  LocalStorageRepository localStorageRepository;

  StorageMoviesNotifier({required 
  this.localStorageRepository
  }):super({});

  Future<void> loadNextPage() async {
    final movies = await localStorageRepository.loadMovies(offset: page * 10); //Todo: Limit
    page++;
    final tempMoviesMap = <int, Movie> {};
    for (final movie in movies) {
        tempMoviesMap[movie.id] = movie;
    }


    state= {...state,...tempMoviesMap};

    // return state;


  }
  

}