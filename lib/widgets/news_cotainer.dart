import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsContainer extends StatelessWidget {
  String imgUrl;
  String newsHead;
  String newsDes;
  String newsUrl;
  String content;

  NewsContainer({
    super.key,
    required this.imgUrl,
    required this.newsHead,
    required this.newsDes,
    required this.newsUrl,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    int maxHead = 32 + 16;
    int maxWord = content.length;
    int desMax = 100;
    if (content.length > 200) {
      maxWord = 200;
    }
    if (newsDes.length < 100) {
      desMax = newsDes.length;
    }
    if (newsHead.length < 100) {
      maxHead = newsHead.length;
    }

    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            imgUrl,
            height: MediaQuery.of(context).size.height / 2.5,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Text(
                  '${newsHead.substring(0, maxHead)}...',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  '${newsDes.substring(0, desMax)}...',
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                  child: Text(
                    '${content.substring(0, maxWord)}...',
                    softWrap: true,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton(
                  onPressed: () async {
                    await launchUrl(Uri.parse(newsUrl));
                  },
                  child: const Text('Read more'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
