
import 'package:cinepedia/presentation/screens/movies/home_screen.dart';
import 'package:cinepedia/presentation/screens/movies/movie_screen.dart';
import 'package:cinepedia/presentation/views/home_views/categorias_views.dart';
import 'package:cinepedia/presentation/views/home_views/favorite_view.dart';
import 'package:cinepedia/presentation/views/home_views/home_view.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [

    ShellRoute(
      builder: (context, state, child) {
        return HomeScreen(childview: child);
      },
      routes: [

        GoRoute(path: '/',
        builder: (context, state) {
          return const HomeView();
        },
        routes: [
              GoRoute(
              path: "movie/:id",
              name: MovieScreen.routeName,
              builder: (context, state){ 
              final movieid = state.pathParameters['id'] ?? 'no-id';
              return MovieScreen(movieId:movieid ,);
          },
    )
        ]
        ),

        GoRoute(path: '/favorites',
        builder: (context, state) {
          return const FavoritesView();
        },),


        GoRoute(
          path: '/categorias',
          builder: (context, state) {
            return const CategoriasViews();
          },
        )




      ]
    
    
    
    )





    // GoRoute(
    //   path: "/home",
    //   name: HomeScreen.routeName,
    //   builder: (context, state) => const HomeScreen(childview: HomeView(),),
    // ),


    // GoRoute(
    //   path: "/movie/:id",
    //   name: MovieScreen.routeName,
    //   builder: (context, state){ 
    //     final movieid = state.pathParameters['id'] ?? 'no-id';
    //     return MovieScreen(movieId:movieid ,);
    //     },
    // )
    
    
    
    
    ]
    );