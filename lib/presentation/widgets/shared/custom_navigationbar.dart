import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({super.key});

   static int getCurrentIndex(BuildContext context) {
    final Uri locationURI = GoRouterState.of(context).uri;
    final String? location = GoRouterState.of(context).name;
        print('$locationURI');


    switch(location){
      case '/':
      return 0;

      case '/categories':
      return 1;

      case '/favorites':
      return 2;

      default:
      return 0;
    }

  }

  void onItemTap(BuildContext context, int index){
    switch(index){
      case 0: context.go('/');
      case 1: context.go('/categorias');
      case 2: context.go('/favorites');
      
      default:
      return context.go('/');
    }
  }

  @override
  Widget build(BuildContext context) {
    return  BottomNavigationBar(
      elevation: 0,
      currentIndex: getCurrentIndex(context),
      onTap: (value){
        onItemTap(context, value);

      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home), 
          label: 'Inicio'),

        BottomNavigationBarItem(
          icon: Icon(Icons.label_outline_rounded), 
          label: 'Categorias'),    
          
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_border_rounded), 
          label: 'Favoritos',

          
          
          ),
          
      ],
      
      
      
      
    );
  }
}