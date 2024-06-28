
import 'package:cinepedia/presentation/screens/movies/home_screen.dart';
import 'package:cinepedia/presentation/screens/movies/movie_screen.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/home',
  routes: [
    GoRoute(
      path: "/home",
      name: HomeScreen.routeName,
      builder: (context, state) => const HomeScreen(),
    ),


    GoRoute(
      path: "/movie/:id",
      name: MovieScreen.routeName,
      builder: (context, state){ 
        final movieid = state.pathParameters['id'] ?? 'no-id';
        return MovieScreen(movieId:movieid ,);
        },
    )
    
    
    
    
    ]
    );