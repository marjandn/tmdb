import 'package:equatable/equatable.dart';
import 'package:tmdb_prj/src/domain/entities/tvshow.dart';

class TvShowResponse extends Equatable {
  final int? page;
  final List<Results>? results;
  final int? totalPages;
  final int? totalResults;

  const TvShowResponse({this.page, this.results, this.totalPages, this.totalResults});

  factory TvShowResponse.fromJson(Map<String, dynamic> json) => TvShowResponse(
        page: json['page'],
        results: (json['results'] == null)
            ? []
            : (json['results'] as List<dynamic>).map((v) => Results.fromJson(v)).toList(),
        totalPages: json['total_pages'],
        totalResults: json['total_results'],
      );

  List<TvShow> toEntity() =>
      results
          ?.map((e) => TvShow(
                backdropPath: e.backdropPath,
                firstAirDate: e.firstAirDate,
                genreIds: e.genreIds,
                id: e.id,
                name: e.name,
                originCountry: e.originCountry,
                originalLanguage: e.originalLanguage,
                originalName: e.originalName,
                overview: e.overview,
                popularity: e.popularity,
                posterPath: e.posterPath,
                voteAverage: e.voteAverage,
                voteCount: e.voteCount,
              ))
          .toList() ??
      [];

  @override
  List<Object?> get props => [page, results, totalPages, totalResults];
}

class Results extends Equatable {
  final String? backdropPath;
  final String? firstAirDate;
  final List<int>? genreIds;
  final int? id;
  final String? name;
  final List<String>? originCountry;
  final String? originalLanguage;
  final String? originalName;
  final String? overview;
  final double? popularity;
  final String? posterPath;
  final double? voteAverage;
  final int? voteCount;

  const Results(
      {this.backdropPath,
      this.firstAirDate,
      this.genreIds,
      this.id,
      this.name,
      this.originCountry,
      this.originalLanguage,
      this.originalName,
      this.overview,
      this.popularity,
      this.posterPath,
      this.voteAverage,
      this.voteCount});

  factory Results.fromJson(Map<String, dynamic> json) => Results(
        backdropPath: json['backdrop_path'],
        firstAirDate: json['first_air_date'],
        genreIds: json['genre_ids'].cast<int>(),
        id: json['id'],
        name: json['name'],
        originCountry: json['origin_country'].cast<String>(),
        originalLanguage: json['original_language'],
        originalName: json['original_name'],
        overview: json['overview'],
        popularity: (json['popularity'] is! double)
            ? double.parse(json['popularity'].toString())
            : json['popularity'],
        posterPath: json['poster_path'],
        voteAverage: (json['vote_average'] is! double)
            ? double.parse(json['vote_average'].toString())
            : json['vote_average'],
        voteCount: json['vote_count'],
      );

  @override
  List<Object?> get props => [
        backdropPath,
        firstAirDate,
        genreIds,
        id,
        name,
        originCountry,
        originalLanguage,
        originalName,
        overview,
        popularity,
        posterPath,
        voteAverage,
        voteCount
      ];
}
