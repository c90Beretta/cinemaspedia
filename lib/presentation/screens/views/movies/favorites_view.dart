


import 'package:cinepedia/presentation/providers/storage/favorites_movies_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class FavoritesView extends ConsumerStatefulWidget {
  const FavoritesView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FavoritesViewState();
}

class _FavoritesViewState extends ConsumerState<FavoritesView>  {

    @override
  void initState() {
    super.initState();

  ref.read(favoritesMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final favoriteMovies = ref.watch(favoritesMoviesProvider).values.toList();

  //   int page= 1;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorite Movie view"),
        centerTitle: true,
        ),
      body: ListView.builder(
        itemCount: favoriteMovies.length,
        itemBuilder: (context, index) {
          final movie = favoriteMovies[index];
         
           return ListTile(
            title: Text(movie.title),
            subtitle: Text(movie.id.toString()),
            onTap: () => context.push('/home/0/movie/${movie.id}'),

            
            );
        },

        )
      
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