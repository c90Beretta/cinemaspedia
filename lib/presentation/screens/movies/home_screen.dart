import 'package:cinepedia/presentation/screens/views/movies/favorites_view.dart';
import 'package:cinepedia/presentation/screens/views/movies/home_view.dart';
import 'package:cinepedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final int pageIndex;
  static const String routeName = '/home';
  const HomeScreen({super.key, required this.pageIndex});

  final viewRoute = const <Widget> [
    HomeView(),
    SizedBox(),
    FavoritesView(),

  
  ];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: IndexedStack(
        index: pageIndex,
        children: viewRoute,
      ),
      bottomNavigationBar:  CustomNavigationBar(currentIndex: pageIndex),
    );
  }
}

