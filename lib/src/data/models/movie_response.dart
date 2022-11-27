import 'package:equatable/equatable.dart';
import 'package:tmdb_prj/src/domain/entities/movie.dart';

class MovieResponse extends Equatable {
  final int? page;
  final List<Results>? results;
  final int? totalPages;
  final int? totalResults;

  const MovieResponse({this.page, this.results, this.totalPages, this.totalResults});

  factory MovieResponse.fromJson(Map<String, dynamic> json) => MovieResponse(
        page: json['page'],
        totalPages: json['total_pages'],
        totalResults: json['total_results'],
        results: json['results'] == null
            ? []
            : (json['results'] as List<dynamic>).map((v) => Results.fromJson(v)).toList(),
      );

  List<Movie> toEntity() =>
      results
          ?.map((e) => Movie(
              totalPage: totalPages,
              adult: e.adult,
              backdropPath: e.backdropPath,
              genreIds: e.genreIds,
              id: e.id,
              originalLanguage: e.originalLanguage,
              originalTitle: e.originalTitle,
              overview: e.overview,
              popularity: e.popularity,
              posterPath: e.posterPath,
              releaseDate: e.releaseDate,
              title: e.title,
              video: e.video,
              voteAverage: e.voteAverage,
              voteCount: e.voteCount))
          .toList() ??
      [];

  Map<String, dynamic> toJson() => {
        'page': page,
        'total_pages': totalPages,
        'results': results?.map((e) => e.toJson()).toList()
      };

  @override
  List<Object?> get props => [
        page,
        results,
        totalPages,
        totalResults,
      ];
}

class Results extends Equatable {
  final bool? adult;
  final String? backdropPath;
  final List<int>? genreIds;
  final int id;
  final String? originalLanguage;
  final String? originalTitle;
  final String? overview;
  final double? popularity;
  final String? posterPath;
  final String? releaseDate;
  final String? title;
  final bool? video;
  final double? voteAverage;
  final int? voteCount;

  const Results(
      {this.adult,
      this.backdropPath,
      this.genreIds,
      required this.id,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.popularity,
      this.posterPath,
      this.releaseDate,
      this.title,
      this.video,
      this.voteAverage,
      this.voteCount});

  factory Results.fromJson(Map<String, dynamic> json) => Results(
        adult: json['adult'],
        backdropPath: json['backdrop_path'],
        genreIds: json['genre_ids'].cast<int>(),
        id: json['id'],
        originalLanguage: json['original_language'],
        originalTitle: json['original_title'],
        overview: json['overview'],
        popularity: (json['popularity'] is! double)
            ? double.parse(json['popularity'].toString())
            : json['popularity'],
        posterPath: json['poster_path'],
        releaseDate: json['release_date'],
        title: json['title'],
        video: json['video'],
        voteAverage: (json['vote_average'] is! double)
            ? double.parse(json['vote_average'].toString())
            : json['vote_average'],
        voteCount: json['vote_count'],
      );

  @override
  List<Object?> get props => [
        adult,
        backdropPath,
        genreIds,
        id,
        originalLanguage,
        originalTitle,
        overview,
        popularity,
        posterPath,
        releaseDate,
        title,
        video,
        voteAverage,
        voteCount
      ];

  Map<String, dynamic> toJson() => {
        'adult': adult,
        'backdrop_path': backdropPath,
        'genre_ids': genreIds,
        'id': id,
        'original_language': originalLanguage,
        'original_title': originalTitle,
        'overview': overview,
        'popularity': popularity,
        'poster_path': posterPath,
        'release_date': releaseDate,
        'title': title,
        'video': video,
        'vote_average': voteAverage,
        'vote_count': voteCount,
      };
}
