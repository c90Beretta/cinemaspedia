
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class AppLoader extends StatelessWidget {
 final String mensaje;
  const AppLoader({super.key, required this.mensaje});

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
                const Text("Cargando", style: TextStyle(fontSize: 25),),
                   Text(mensaje, style: const TextStyle(fontSize: 40),),
              ],
            ),),
          ),
    );}
}