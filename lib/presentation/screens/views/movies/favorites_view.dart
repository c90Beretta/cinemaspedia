


import 'package:cinepedia/presentation/providers/storage/favorites_movies_provider.dart';
import 'package:cinepedia/presentation/widgets/shared/app_loader.dart';
import 'package:cinepedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoritesView extends ConsumerStatefulWidget {
  const FavoritesView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FavoritesViewState();
}

class _FavoritesViewState extends ConsumerState<FavoritesView>  {

    bool isLoading = false;
    bool islastPage = false;  


    @override
  void initState() {
    super.initState();
     loadNextPage();

    }


    void loadNextPage() async{
      // ignore: avoid_print
      print("LoadNextPage CALL");
        if( isLoading || islastPage) return;

        isLoading = true;
        final movies = await ref.read(favoritesMoviesProvider.notifier).loadNextPage();
        
        if(movies.isEmpty){
          islastPage = true;
        }
        isLoading = false;

        ref.watch(favoritesMoviesProvider.notifier);

    }




  @override
  Widget build(BuildContext context) {
    final favoriteMovies = ref.watch(favoritesMoviesProvider).values.toList();



    return Scaffold(
     
      appBar: AppBar(
        title: const Text("Favorite Movie view"),
        centerTitle: true,
        ),
      body: favoriteMovies.isEmpty ? const Center(child: AppLoader(text: "No hay favoritos Para Mostrar"),) : 
      MovieMansonry(
        movies: favoriteMovies, loadNextPage: loadNextPage,),
      floatingActionButton: FloatingActionButton(
        onPressed: () => ref.read(favoritesMoviesProvider.notifier).loadNextPage(),
        child: const Icon(Icons.add),
      ),
    );
  }
}




































