import 'package:cinepedia/presentation/providers/movies/movies_slideshow_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/providers.dart';
import '../../widgets/widgets.dart';


class HomeView extends ConsumerStatefulWidget {
  static String name = 'homeview';
  const HomeView({super.key});

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends ConsumerState<HomeView> {
  @override
  void initState() {
    super.initState();

    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    ref.read(popularMoviesProvider.notifier).loadNextPage();
    ref.read(topRatedMoviesProvider.notifier).loadNextPage();
    ref.read(getUpComingMoviesProvider.notifier).loadNextPage();

  }

  @override

  Widget build(BuildContext context) {
    final initialLoader = ref.watch(initialLoaderProvider);
    if(initialLoader) return const FullScreenLoader();

    
    final slideShowMovies = ref.watch(moviesSlideshowProvider);

    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final popularMovies = ref.watch(popularMoviesProvider);
    final topRatedMovies = ref.watch(topRatedMoviesProvider);
    final upComingMovies = ref.watch(getUpComingMoviesProvider);


    return CustomScrollView(

      slivers: [
        const SliverAppBar(
          floating: true ,
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            titlePadding:  EdgeInsets.symmetric(horizontal: 2, vertical: 10),
            title: CustomAPPBar(),
          ),
        ),


        SliverList(
            delegate: SliverChildBuilderDelegate(
          (context, index) {
            return Column(
              children: [
                MoviesSlideShow(movie: slideShowMovies),


                
                MovieHorizontalListView(
                  movie: nowPlayingMovies,
                  title: "En Cartelera",
                  subTitle: "Lunes 20",
                  loadNextPage: () {},
                ),
                MovieHorizontalListView(
                  movie: topRatedMovies,
                  title: "TOP RATED",
                  subTitle: "Todo el tiempo",
                  loadNextPage: () {
                    ref.read(topRatedMoviesProvider.notifier).loadNextPage();
                  },
                ),
                MovieHorizontalListView(
                  movie: popularMovies,
                  title: "Populares",
                  subTitle: "Top 20",
                  loadNextPage: () {
                    ref.read(popularMoviesProvider.notifier).loadNextPage();
                  },
                ),
                const SizedBox(
                  height: 50,
                ),
                   MovieHorizontalListView(
                  movie: upComingMovies,
                  title: "Proximamente",
                  subTitle: "Fechas de estreno",
                  loadNextPage: () {
                    ref.read(getUpComingMoviesProvider.notifier).loadNextPage();
                  },
                ),
                const SizedBox(
                  height: 50,
                )
              ],
            );
          },
          childCount: 1,
        )),
      ],
    );
  }
}
