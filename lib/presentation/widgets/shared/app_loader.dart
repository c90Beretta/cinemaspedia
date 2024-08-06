


import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class AppLoader extends StatelessWidget {
  final String? text;
  const AppLoader({super.key, this.text});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: SizedBox(
            child: Center(child: Column(
              mainAxisAlignment: MainAxisAlignment.center, 
              children: [
                const SizedBox(height: 70,),
                  Bounce(
                  infinite: true,
                  child: Image.asset('assets/edesarrollos_icon_logo.png'),
                ),
                 Text(
                  text ??
                  "Cargando", style: const TextStyle(fontSize: 25),),
              ],
            ),),
          ),
    );}
}