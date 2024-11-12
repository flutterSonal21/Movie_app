import 'dart:convert';

import 'package:http/http.dart' as http;

class Movie {
  final String title;
  final String image;
  final String summary;

  Movie({required this.title, required this.image, required this.summary});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json['show']['name'],
      image: json['show']['image']['medium'],
      summary: json['show']['summary'] ?? '',
    );
  }
}

class MovieService {
  final String baseUrl = 'https://api.tvmaze.com/search/shows?q=all';

  Future<List<Movie>> fetchMovies() async {
    final response = await http.get(Uri.parse(baseUrl + 'all'));
    if (response.statusCode == 200) {
      return (json.decode(response.body) as List)
          .map((data) => Movie.fromJson(data))
          .toList();
    } else {
      throw Exception('Failed to load movies');
    }
  }

  Future<List<Movie>> searchMovies(String query) async {
    final response = await http.get(Uri.parse(baseUrl + query));
    if (response.statusCode == 200) {
      return (json.decode(response.body) as List)
          .map((data) => Movie.fromJson(data))
          .toList();
    } else {
      throw Exception('Failed to load movies');
    }
  }
}
