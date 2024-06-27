import 'package:flutter/material.dart';


class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return  BottomNavigationBar(
      elevation: 0,
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