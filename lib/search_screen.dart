// import 'package:flutter/material.dart';
// import 'movie_service.dart';
// import 'widgets/movie_card.dart';
// import 'widgets/search_bar.dart' as custom_widgets;

// class SearchScreen extends StatefulWidget {
//   @override
//   _SearchScreenState createState() => _SearchScreenState();
// }

// class _SearchScreenState extends State<SearchScreen> {
//   final MovieService _movieService = MovieService();
//   List<Movie> _movies = [];

//   void _searchMovies(String query) async {
//     final results = await _movieService.searchMovies(query);
//     setState(() {
//       _movies = results;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Search Movies'),
//       ),
//       body: 
      
//       Column(
//         children: [
//           custom_widgets.SearchBar(onSubmitted: _searchMovies),
//           Expanded(
//             child: ListView.builder(
//               itemCount: _movies.length,
              
//               itemBuilder: (context, index) {

//                 return MovieCard(movie: _movies[index]);
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }



import 'dart:async';

import 'package:flutter/material.dart';

import 'movie_service.dart';
import 'widgets/movie_card.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final MovieService _movieService = MovieService();
  List<Movie> _movies = [];
  TextEditingController _searchController = TextEditingController();
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  void _onSearchChanged() {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      _searchMovies(_searchController.text);
    });
  }

  void _searchMovies(String query) async {
    if (query.isEmpty) {
      setState(() {
        _movies = [];
      });
      return;
    }
    
    final results = await _movieService.searchMovies(query);
    setState(() {
      _movies = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Movies'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                hintText: 'Search for movies...',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: _movies.isEmpty
                ? const Center(
                    child: Text(
                      'No movies found. Try searching for something else.',
                      style: TextStyle(fontSize: 16),
                    ),
                  )
                : ListView.builder(
                    itemCount: _movies.length,
                    itemBuilder: (context, index) {
                      return MovieCard(movie: _movies[index]);
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
