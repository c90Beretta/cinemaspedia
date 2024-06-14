
import 'package:animate_do/animate_do.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:cinepedia/config/domain/entities/movie.dart';
import 'package:flutter/material.dart';


class MoviesSlideShow extends StatelessWidget {
  final List<Movie> movie;

  const MoviesSlideShow({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return SizedBox(
      width: double.infinity,
      height: 210,
      child: Swiper(
        pagination: SwiperPagination(
          margin: const EdgeInsets.only(top: 10),
          builder: DotSwiperPaginationBuilder(
            color: colors.secondary,
            activeColor: colors.primary,
          )
        ),
        viewportFraction: 0.45,
        scale: 0.9,
        autoplay: true,
        itemCount: movie.length,
        itemBuilder: (context, index) {
          final movies = movie[index];
          return _Slide(movie: movies);
        },
        ),
    );
  }
}


class _Slide extends StatelessWidget {
  final Movie movie;
  const _Slide({required this.movie});

  @override
  Widget build(BuildContext context) {
    const  decoration =   BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.black26,
          offset: Offset(0, 10),
          blurRadius: 10,
        )
      ]
    );
    return  Padding(
      padding:  const EdgeInsets.only( bottom: 30),
      child: DecoratedBox(
        decoration: decoration,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(
            movie.backdropPath,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return FadeIn(child: child);
              
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          ))),
    );
  }
}