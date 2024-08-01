


import 'package:cinepedia/presentation/providers/storage/favorites_movies_provider.dart';
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
      print("LoadNextPage CALL");
        if( isLoading || islastPage) return;

        isLoading = true;
        final movies = await ref.read(favoritesMoviesProvider.notifier).loadNextPage();
        
        if(movies.isEmpty){
          islastPage = true;
        }
        isLoading = false;
    }




  @override
  Widget build(BuildContext context) {
    final favoriteMovies = ref.watch(favoritesMoviesProvider).values.toList();



    return Scaffold(
      backgroundColor: const Color.fromARGB(255,244,247,252),
      appBar: AppBar(
        title: const Text("Favorite Movie view"),
        centerTitle: true,
        ),
      body: favoriteMovies.isEmpty ? const Center(child: Text("No hay Peliculas Favoritas"),) : 
      MovieMansonry(
        movies: favoriteMovies, loadNextPage: loadNextPage,)

  
    );
  }
}




































//  FutureBuilder(
//         future: ref.watch(localStorageRepositoryProvider).loadMovies(),
//         builder: (context, snapshot) {
//           if(snapshot.connectionState == ConnectionState.waiting){
//             return const Center(child: AppLoader());
//           }else if(snapshot.hasError){
//             return const Center(child: Text("Status Failed, No se ha podido Comunicar con BDD"),);
//           } else{
        
//         return ListView.builder(
//           itemCount: snapshot.data!.length,
//           itemBuilder: (context, index) {
//             var movie = snapshot.data?[index];
//             var movieID = movie!.id.toString();
            
//             return ListTile(
//               onTap: () => context.push('/home/0/movie/$movieID'),
//               title: Text(movie.title),
//               subtitle: Text('${movie.id}')
        
//             );
//           },
        
//         );
//           }
//           }
//       ),