import 'package:cinepedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'home';

  final Widget childview;
  const HomeScreen({super.key, required this.childview});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:childview,
      bottomNavigationBar: const CustomNavigationBar(),
    );
  }
}

