
import 'package:cinepedia/presentation/screens/home_screen.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/home',
  routes: [
    GoRoute(
      path: "/home",
      name: HomeScreen.routeName,
      builder: (context, state) => const HomeScreen(),
    )
    
    
    
    
    
    ]
    );