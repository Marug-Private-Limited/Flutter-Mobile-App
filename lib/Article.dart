import 'package:flutter/material.dart';


class Article {
  num id;
  final String title;
  final String description;
  final String url;
  final String publishedAt;
  final String author;
  final String source;
  final String content;
  final String imageUrl;
  final String category;
  bool bookmarked = false;

  Article(
      {this.id,
        this.title,
        this.description,
        this.url,
        this.publishedAt,
        this.author,
        this.source,
        this.content,
        this.imageUrl,
        this.category,
        this.bookmarked});

  factory Article.fromMap(Map<String, dynamic> data, {network = false}) {
    return Article(
      id: data['id'],
      title: data['title'],
      description: data['description'],
      url: data['url'],
      publishedAt: data['publishedAt'],
      author: data['author'],
      source: network ? data['source']['name'] : data['source'],
      content: data['content'],
      imageUrl: data['urlToImage'],
      category: data['category'] ?? '',
      bookmarked: (data['bookmarked'] ?? false) == 1,
    );
  }

  Map<String, dynamic> toMap({category}) {
    return {
      'title': title,
      'description': description,
      'url': url,
      'publishedAt': publishedAt,
      'author': author,
      'source': source,
      'content': content,
      'urlToImage': imageUrl,
      'category': category ?? this.category,
      'bookmarked': bookmarked,
    };
  }



  bool get isValid => title != null && title.length > 3 && url != null;
}

const categories = {
  'All': '',
  'Technology': 'technology',
  'Business': 'business',
  'Entertainment': 'entertainment',
  'Health': 'health',
  'Science': 'science',
  'Sports': 'sports',
  'General': 'general',
  'local': 'local'
};

enum Menu { local, headlines, favorites, agencies }