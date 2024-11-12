import 'package:flutter/material.dart';
import 'movie_service.dart';

class DetailsScreen extends StatelessWidget {
  final Movie movie;

  DetailsScreen({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(movie.title)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.network(movie.image),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(movie.summary, style: TextStyle(fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}
