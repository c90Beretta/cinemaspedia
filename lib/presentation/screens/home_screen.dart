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
    return const Scaffold(
      body: _HomeView(),
      bottomNavigationBar: CustomNavigationBar(),
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
    ref.read(popularMoviesProvider.notifier).loadNextPage();
    ref.read(topRatedMoviesProvider.notifier).loadNextPage();
    ref.read(getUpComingMoviesProvider.notifier).loadNextPage();

  }

  @override
  Widget build(BuildContext context) {
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
            title: CustomAPPBar(),
          ),
        ),


        SliverList(
            delegate: SliverChildBuilderDelegate(
          (context, index) {
            return Column(
              children: [
                // const CustomAPPBar(),
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
