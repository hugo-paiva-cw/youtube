import 'package:flutter/material.dart';
import 'api_youtube.dart';

class Start extends StatefulWidget {
  const Start({Key? key}) : super(key: key);

  @override
  State<Start> createState() => _StartState();
}

class _StartState extends State<Start> {
  @override
  Widget build(BuildContext context) {

    ApiYoutube apiYoutube = ApiYoutube();
    apiYoutube.search('android');

    return const Center(
      child: Text(
        'Início',
        style: TextStyle(fontSize: 25),
      ),
    );
  }
}