import 'dart:convert';

import 'package:http/http.dart';
import 'package:in_short/model/news_model.dart';

const url =
    'https://newsapi.org/v2/top-headlines?apiKey=putHere';

class FetchNews {
  Future<List<NewsItem>> fetchNews() async {
    Response response = await get(Uri.parse(url));

    Map bodyData = jsonDecode(response.body);

    List<NewsItem> newsList = [];

    for (int i = 0; i < bodyData['articles'].length; i++) {
      newsList.add(
        NewsItem.fromJson(
          jsonEncode(bodyData['articles'][i]),
        ),
      );
    }

    return newsList;
  }
}
