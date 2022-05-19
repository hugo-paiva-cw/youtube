import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:youtube/models/video.dart';
const CHANNEL_URL = 'https://www.googleapis.com/youtube/v3/';

class ApiYoutube {

  Future<List<Video>> search(String search) async {
    await dotenv.load();
    Uri uri = Uri.parse(
      CHANNEL_URL + 'search' +
        '?part=snippet' +
        '&type=video' +
        '&maxResults=20' +
        '&order=date' +
        '&key=${dotenv.env['YOUTUBE_API_KEY']}' +
        '&channelId=${dotenv.env['CHANNEL_ID']}' +
        '&q=$search'
    );

    http.Response response = await http.get(uri);

    if ( response.statusCode == 200) {
      Map<String, dynamic> jsonData = json.decode(response.body);

      List<Video> videos = jsonData['items'].map<Video>(
              (map) {
            return Video.fromJson(map);
          }
      ).toList();
      return videos;

    } else {
      print(response.statusCode);
      print( response.body );
    }
    return [];
  }
}
