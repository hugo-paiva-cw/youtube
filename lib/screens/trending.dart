import 'package:flutter/material.dart';

class Trending extends StatefulWidget {
  const Trending({Key? key}) : super(key: key);

  @override
  State<Trending> createState() => _TrendingState();
}

class _TrendingState extends State<Trending> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Em alta',
        style: TextStyle(
          fontSize: 25
        ),
      ),
    );
  }
}
