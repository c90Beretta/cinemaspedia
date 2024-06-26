import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({super.key});


  Stream<String> getLoadingMessages(){
  final messages = <String>[  
    'Cargando...',
    'Porfavor Espere...',
    'Cargando Peliculas...',
    'Comprando Palomitas...',
    'Preparando Palomitas...',
    'Comiendo Palomitas...',
    'Voy a buscar más palomitas...',
    'Estoy buscando más palomitas...',
    'Esto está tardando más de lo esperado :(',

  ];
    return Stream.periodic(const Duration(milliseconds: 2300), (step) => messages[step],).take(messages.length);
  }

  @override
  Widget build(BuildContext context) {
    return   Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Bounce(
            infinite: true,
            child: BounceInDown(
              child: const FlutterLogo(size: 60,)),
          ),
          const Text('Espere Porfavor...', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),),
          const SizedBox(height: 10),

          StreamBuilder(
            stream: getLoadingMessages(),
             builder: (context, snapshot){
               if(snapshot.hasData){
                 return Text(snapshot.data!, style: const TextStyle(fontSize: 18),);
               }else{
                 return const Text('Cargando...', style: TextStyle(fontSize: 18),);
               }
             }
             
             )
        ],
      ),
      );
  }
}