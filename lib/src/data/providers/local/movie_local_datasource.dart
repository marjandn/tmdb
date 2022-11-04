import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:tmdb_prj/src/data/models/movie_response.dart';

abstract class MovieLocalDataSource {
  Future<void> savePopularMoviesFirstPage({required MovieResponse movieResponse});

  MovieResponse? getPopularMoviesFirstPage();
}

class MovieLocalDataSourceImpl extends MovieLocalDataSource {
  static const String popularMoviesKey = "popular_movies";

  final SharedPreferences sharedPreferences;

  MovieLocalDataSourceImpl({required this.sharedPreferences});

  @override
  MovieResponse? getPopularMoviesFirstPage() {
    String? json = sharedPreferences.getString(popularMoviesKey);

    if (json != null) return MovieResponse.fromJson(jsonDecode(json));
    return null;
  }

  @override
  Future<void> savePopularMoviesFirstPage({required MovieResponse movieResponse}) async {
    sharedPreferences.setString(popularMoviesKey, jsonEncode(movieResponse.toJson()));
  }
}
