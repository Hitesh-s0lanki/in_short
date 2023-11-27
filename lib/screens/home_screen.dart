import 'package:flutter/material.dart';
import 'package:in_short/controller/fetch_news.dart';
import 'package:in_short/model/news_model.dart';
import 'package:in_short/widgets/loading.dart';
import 'package:in_short/widgets/news_cotainer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final fetchNews = FetchNews();

  List<NewsItem> news = [];

  @override
  void initState() {
    getNews();
    super.initState();
  }

  void getNews() async {
    news = await fetchNews.fetchNews();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: news.isEmpty
          ? const Loader()
          : PageView.builder(
              scrollDirection: Axis.vertical,
              itemCount: news.length,
              itemBuilder: (context, index) {
                return NewsContainer(
                  imgUrl: news[index].urlToImage ??
                      'https://t4.ftcdn.net/jpg/02/51/95/53/360_F_251955356_FAQH0U1y1TZw3ZcdPGybwUkH90a3VAhb.jpg',
                  newsHead: news[index].title ?? '',
                  newsDes: news[index].description ?? '',
                  newsUrl: news[index].url ?? '',
                  content: news[index].content ?? '',
                );
              },
            ),
    );
  }
}
