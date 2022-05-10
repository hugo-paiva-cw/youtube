import 'package:flutter/material.dart';
import 'package:youtube/custom_search_delegate.dart';
import 'package:youtube/screens/library.dart';
import 'package:youtube/screens/subscriptions.dart';
import 'package:youtube/screens/trending.dart';
import 'package:youtube/screens/start.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  var _indexValue = 0;
  String _result = '';

  @override
  Widget build(BuildContext context) {

    List<Widget> screens = [
      Start(search: _result,),
      const Trending(),
      const Subscriptions(),
      const Library()
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.grey),
        title: Image.asset(
          'assets/images/youtube.png',
          width: 98,
          height: 22,
        ),
        actions: [
          IconButton(
              icon: const Icon(Icons.search),
              onPressed: () async {
                String? res = await showSearch(
                    context: context, delegate: CustomSearchDelegate());
                setState(() {
                  _result = res!;
                });
              }),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: screens[_indexValue],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indexValue,
        onTap: (index) {
          setState(() {
            _indexValue = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.red,
        items: const [
          BottomNavigationBarItem(
              //  backgroundColor: Colors.red,
              label: 'Início',
              icon: Icon(Icons.home)),
          BottomNavigationBarItem(
              // backgroundColor: Colors.orange,
              label: 'Em alta',
              icon: Icon(Icons.whatshot)),
          BottomNavigationBarItem(
              // backgroundColor: Colors.blue,
              label: 'Inscrições',
              icon: Icon(Icons.subscriptions)),
          BottomNavigationBarItem(
              // backgroundColor: Colors.green,
              label: 'Biblioteca',
              icon: Icon(Icons.folder)),
        ],
      ),
    );
  }
}
