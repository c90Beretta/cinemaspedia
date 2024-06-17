import 'package:cinepedia/presentation/providers/movies/movies_slideshow_provider.dart';
import 'package:cinepedia/presentation/providers/providers.dart';
import 'package:cinepedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class HomeScreen extends StatelessWidget {
  static const String routeName = '/home';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body:  _HomeView(),
      bottomNavigationBar: 
      CustomNavigationBar(),
    );
  }
}



class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {

  @override
  void initState() {
    super.initState();

    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();

  }

  @override
  Widget build(BuildContext context) {
    final slideShowMovies = ref.watch(moviesSlideshowProvider);
    final  nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);



    return Column(
      children: [
        const CustomAPPBar(),

        MoviesSlideShow(movie: slideShowMovies),


        MovieHorizontalListView(
          movie: nowPlayingMovies,
          title: "En Cartelera",
          subTitle: "Lunes 20",
          loadNextPage: (){ 
            ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
          },
          ),
         
        
      ],
    );
  }
}
