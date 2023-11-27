import 'dart:convert';

import 'package:flutter/foundation.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class NewsItem {
  String? title;
  String? description;
  String? author;
  String? urlToImage;
  String? url;
  String? content;
  String? publishedAt;
  Map<String, dynamic>? source;

  NewsItem({
    this.title,
    this.description,
    this.author,
    this.urlToImage,
    this.url,
    this.publishedAt,
    this.source,
    this.content,
  });

  NewsItem copyWith({
    String? title,
    String? description,
    String? author,
    String? urlToImage,
    String? url,
    String? publishedAt,
    String? content,
    Map<String, dynamic>? source,
  }) {
    return NewsItem(
      title: title ?? this.title,
      description: description ?? this.description,
      author: author ?? this.author,
      urlToImage: urlToImage ?? this.urlToImage,
      url: url ?? this.url,
      publishedAt: publishedAt ?? this.publishedAt,
      source: source ?? this.source,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'description': description,
      'author': author,
      'urlToImage': urlToImage,
      'url': url,
      'publishedAt': publishedAt,
      'source': source,
      'content': content,
    };
  }

  factory NewsItem.fromMap(Map<String, dynamic> map) {
    return NewsItem(
      title: map['title'] != null ? map['title'] as String : null,
      content: map['content'] != null ? map['content'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      author: map['author'] != null ? map['author'] as String : null,
      urlToImage:
          map['urlToImage'] != null ? map['urlToImage'] as String : null,
      url: map['url'] != null ? map['url'] as String : null,
      publishedAt:
          map['publishedAt'] != null ? map['publishedAt'] as String : null,
      source: map['source'] != null
          ? Map<String, dynamic>.from(
              (map['source'] as Map<String, dynamic>),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory NewsItem.fromJson(String source) =>
      NewsItem.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'NewsItem(title: $title, description: $description, author: $author, urlToImage: $urlToImage, url: $url, publishedAt: $publishedAt, source: $source, content: $content)';
  }

  @override
  bool operator ==(covariant NewsItem other) {
    if (identical(this, other)) return true;

    return other.title == title &&
        other.description == description &&
        other.author == author &&
        other.content == content &&
        other.urlToImage == urlToImage &&
        other.url == url &&
        other.publishedAt == publishedAt &&
        mapEquals(other.source, source);
  }

  @override
  int get hashCode {
    return title.hashCode ^
        description.hashCode ^
        author.hashCode ^
        urlToImage.hashCode ^
        url.hashCode ^
        content.hashCode ^
        publishedAt.hashCode ^
        source.hashCode;
  }
}
