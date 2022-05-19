import 'package:flutter/material.dart';
import '../models/video.dart';
import '../api/api_youtube.dart';

class Start extends StatefulWidget {
  String? search;
  Start({this.search, Key? key}) : super(key: key);

  @override
  State<Start> createState() => _StartState();
}

class _StartState extends State<Start> {
  _listVideos(String search) {
    ApiYoutube apiYoutube = ApiYoutube();
    return apiYoutube.search(search);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Video>>(
        future: _listVideos(widget.search!),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case ConnectionState.active:
            case ConnectionState.done:
              if (snapshot.hasData) {
                return ListView.separated(
                    itemBuilder: (context, index) {
                      List<Video> videos = snapshot.data!;
                      Video video = videos[index];
                      return GestureDetector(
                          child: Column(
                            children: [
                              Container(
                                height: 200,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                  image: NetworkImage(video.image!),
                                  fit: BoxFit.cover,
                                )),
                              ),
                              ListTile(
                                title: Text(video.title!),
                                subtitle: Text(video.channel!),
                              )
                            ],
                          ));
                    },
                    separatorBuilder: (context, index) => const Divider(
                          height: 2,
                          color: Colors.grey,
                        ),
                    itemCount: snapshot.data?.length ?? 0);
              } else {
                return const Text('Erouuu!');
              }
            default:
              return Container();
          }
        });
  }
}
