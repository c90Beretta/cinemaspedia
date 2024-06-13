import 'package:cinepedia/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:  _HomeView(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView({
    super.key,
  });

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();

  }

  @override
  Widget build(BuildContext context) {
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);

    if (nowPlayingMovies.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return ListView.builder(
      itemCount: nowPlayingMovies.length,

      itemBuilder: (context, index) {
        final movie = nowPlayingMovies[index];
        
        return ListTile(
          title: Text(movie.title),
        );
        
      },
      
    );
  }
}
