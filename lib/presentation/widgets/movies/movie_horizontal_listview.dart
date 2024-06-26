import 'package:animate_do/animate_do.dart';
import 'package:cinepedia/config/helpers/human_formats.dart';
import 'package:flutter/material.dart';

import '../../../config/domain/entities/movie.dart';


class MovieHorizontalListView extends StatefulWidget {

  final List<Movie> movie;
  final String? title;
  final String? subTitle;
  final VoidCallback? loadNextPage;

  const MovieHorizontalListView({super.key, required this.movie, this.title, this.subTitle, this.loadNextPage});

  @override
  State<MovieHorizontalListView> createState() => _MovieHorizontalListViewState();
}

class _MovieHorizontalListViewState extends State<MovieHorizontalListView> {

  final scrollController = ScrollController();


  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      if(widget.loadNextPage == null) return;
      if(scrollController.position.pixels + 100 >= scrollController.position.maxScrollExtent){
        const AlertDialog(
          title: Text('Cargando...'),
          content: LinearProgressIndicator(),
        );
        widget.loadNextPage!();
      }




    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 430,
      width: double.infinity,
      child: Column(
        children: [
          _Title(
            title: widget.title,
            subTitle: widget.subTitle,),

          Expanded(
            child: ListView.builder(
              controller: scrollController,
              itemCount: widget.movie.length,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return FadeInRight(child: _Slide(movie: widget.movie[index]));
                
              },
              
            ),
          )
          
       

        ],
      )
      
    );

  }
}

class _Slide extends StatelessWidget {
  final Movie movie;
  const _Slide({ required this.movie});

  @override
  Widget build(BuildContext context) {

    final textStyle = Theme.of(context).textTheme;

    return   Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 170,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeIn(
                //* IMAGEN PARA EL LIST VIEW
                child: Image.network(
                  width: 160,
                   movie.posterPath,
                   loadingBuilder: (context, child, loadingProgress) {
                      if(loadingProgress == null) return child;
                      return const Padding(
                        padding: EdgeInsets.all(10),
                        child: Center(
                          
                          child:  CircularProgressIndicator(
                            strokeWidth: 4,
                            
                          ),
                        ),
                      );
                    
                   },
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),


          const SizedBox(height: 5),


            //* TITULO DE LA PELICULA
           SizedBox(
            width: 140,
            child: Text(
              movie.title,
              maxLines: 2,
              style: textStyle.titleSmall,
            ),
          ),


          const SizedBox(height: 10),

          //* RATING DE LA PELICULA
          SizedBox(
            width: 150,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
               const Icon(Icons.star, size: 15, color: Colors.amber,),
               const SizedBox(width: 3),
                Text(
                  movie.voteAverage.toString().substring(0,3),
                  style: textStyle.titleSmall?.copyWith(color: Colors.amber.shade800),
                ),
               const Spacer(),
                Text("(${HumanFormats.number(movie.popularity).toString()})" ,
                
                  style: textStyle.titleSmall?.copyWith(color: Colors.grey.shade600),
                ),
              ],
            ),
          )


        ],
      ),
    );
  }
}


class _Title extends StatelessWidget {
  final String? title;
  final String? subTitle;

  const _Title({ this.title, this.subTitle});

  @override
  Widget build(BuildContext context) {

    final textStyle = Theme.of(context).textTheme.titleLarge;


    return  Container(
      padding: const EdgeInsets.only(top: 20),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if(title != null)
            Text(title!, style: textStyle,),
          
          const Spacer(),

          if(subTitle != null)
            FilledButton.tonalIcon(
              style: const ButtonStyle(
                
              ),
              onPressed: () {},
              icon: const Icon(Icons.date_range_outlined),
              label: Text(subTitle!, style: textStyle)),

        ],
      ),
    );
  }
}