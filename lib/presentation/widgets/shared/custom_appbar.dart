import 'package:flutter/material.dart';


class CustomAPPBar extends StatelessWidget {
  const CustomAPPBar({super.key});

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;
    final titleStyle = Theme.of(context).textTheme.titleMedium;

    return  SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        child: SizedBox(
          width: double.infinity,
          child: Row(
            children: [
              Icon(Icons.movie_outlined, color: colors.primary ),
              const SizedBox(width: 10),
              Text('Cinepedia', style: titleStyle,),
      
      
              const Spacer(),
      
      
              IconButton(
              onPressed: (){}, 
              icon:  Icon(Icons.search_rounded, color: colors.primary),
              
              ),
            ],
          ),
      
        ),
      ),
      
    );
  }
}