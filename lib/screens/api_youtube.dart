import 'package:http/http.dart' as http;
import 'dart:convert';
const YOUTUBE_API_KEY = 'AIzaSyDu8rXtn8I2se4VoTBGB4MKGehcLZy0vTQ';
const CHANNEL_ID = 'UCVHFbqXqoYvEWM1Ddxl0QDg';
const CHANNEL_URL = 'https://www.googleapis.com/youtube/v3/';

class ApiYoutube {

  search(String search) async {
    Uri uri = Uri.parse(
      CHANNEL_URL + 'search' +
        '?part=snippet' +
        '&type=video' +
        '&maxResults=20' +
        '&order=date' +
        '&key=$YOUTUBE_API_KEY' +
        '&channelId=$CHANNEL_ID' +
        '&q=$search'
    );

    http.Response response = await http.get(uri);

    if ( response.statusCode == 200) {
      print('Tudo certo');
      print( response.body );
      Map<String, dynamic> jsonData = json.decode(response.body);
      print(jsonData['items'][3]['snippet']['title']);
    } else {
      print('Algo errado não está certo!');
      print(response.statusCode);
      print( response.body );
    }
  }

}
