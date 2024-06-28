import 'package:cinepedia/config/domain/entities/movie.dart';
import 'package:cinepedia/presentation/providers/movies/movie_info_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class MovieScreen extends ConsumerStatefulWidget {
  static const String routeName = 'movie-screen';
  final String movieId;


  const MovieScreen({
    super.key, required this.movieId});

  @override
  MovieScreenState createState() => MovieScreenState();
}

class MovieScreenState extends ConsumerState<MovieScreen> {

  @override
  void initState() {
    super.initState();
    ref.read(movieInfoProvider.notifier).loadMovie(widget.movieId);

  }
  @override
  void dispose() {
    super.dispose();
  }





  @override
  Widget build(BuildContext context) {
    final  movie = ref.watch(movieInfoProvider)[widget.movieId];
    if(movie == null) return const Scaffold(body:  Center(child: CircularProgressIndicator(strokeWidth: 2,),));
    return Scaffold(
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          _CustomSliverAppBar(movie: movie),
          SliverList(
            delegate: SliverChildBuilderDelegate(

            (context, index) =>   _Moviedetails(movie: movie),
            childCount: 1,))
            
          

        ],
        )
      );
    
  }
}



class _Moviedetails extends StatelessWidget {
  final Movie movie;
  const _Moviedetails({required this.movie});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final textStyle = Theme.of(context).textTheme;


    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.network(movie.backdropPath, width: size.width * 0.3, height: size.height * 0.3, fit: BoxFit.cover,),
              ),
            ),
            const SizedBox(width: 15,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  SizedBox(height: 15,),
                  Text(movie.title, style: textStyle.headlineLarge,),
                  Text(movie.releaseDate.toString(),),
                  Text(movie.overview, style: textStyle.bodyLarge,),
                ],
              ),
            ),
            const SizedBox(height: 200,)
          ],
        ),

      ],
    );
  }
}




class _CustomSliverAppBar extends StatelessWidget {
  final Movie movie;
  const _CustomSliverAppBar({
    required this.movie
    });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;


    return SliverAppBar(
      backgroundColor: Colors.black,
      expandedHeight: size.height * 0.8,
      // foregroundColor: Colors.white,
      // flexibleSpace: FlexibleSpaceBar(
      //   titlePadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      //   title: Text(movie.title, style: const TextStyle(fontSize: 20), textAlign: TextAlign.start,),
        flexibleSpace: Stack(
          children: [
            Positioned.fill(child: Image.network(movie.posterPath
            ,fit: BoxFit.cover,),),
            const SizedBox.expand(
              child: DecoratedBox(decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  stops: [0.0, 0.3],
                  colors: <Color>[
                    Colors.black87,
                    Colors.transparent,
                  ],
                ),
              ),
              ),
            ),
            const SizedBox.expand(
              child: DecoratedBox(decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.7, 1],
                  colors: <Color>[
                    Colors.transparent,
                    Colors.black54,
                  ],
                ),
              ),
              ),
            )
          ],
        ),
        
      );
    
  }
}