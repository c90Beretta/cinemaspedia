
import 'package:cinepedia/presentation/screens/movies/home_screen.dart';
import 'package:cinepedia/presentation/screens/movies/movie_screen.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/home/0',
  routes: [
    GoRoute(
      path: "/home/:page",
      name: HomeScreen.routeName,
      builder: (context, state) {
        final pageIndex = int.parse(state.pathParameters['page'] ?? '0');
        return  HomeScreen(pageIndex: pageIndex,);
      },
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