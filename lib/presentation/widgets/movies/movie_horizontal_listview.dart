import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../config/domain/entities/movie.dart';


class MovieHorizontalListView extends StatelessWidget {

  final List<Movie> movie;
  final String? title;
  final String? subTitle;
  final VoidCallback? loadNextPage;





  const MovieHorizontalListView({super.key, required this.movie, this.title, this.subTitle, this.loadNextPage});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 362,
      width: double.infinity,
      child: Column(
        children: [
          _Title(
            title: title,
            subTitle: subTitle,),

          Expanded(
            child: ListView.builder(
              itemCount: movie.length,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return _Slide(movie: movie[index]);
                
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 150,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeIn(
                //* IMAGEN PARA EL LIST VIEW
                child: Image.network(
                  width: 150,
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

           SizedBox(
            width: 160,
            child: Text(
              
              movie.title,
              maxLines: 2,
              style: textStyle.titleSmall,
            ),
          ),
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