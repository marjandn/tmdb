import 'package:equatable/equatable.dart';
import 'package:tmdb_prj/src/domain/entities/people.dart';

class PeopleResponse extends Equatable {
  final int? page;
  final List<PersonRespone>? results;
  final int? totalPages;
  final int? totalResults;

  const PeopleResponse({this.page, this.results, this.totalPages, this.totalResults});

  factory PeopleResponse.fromJson(Map<String, dynamic> json) => PeopleResponse(
        page: json['page'],
        totalPages: json['total_pages'],
        totalResults: json['total_results'],
        results: json['results'] == null
            ? []
            : (json['results'] as List).map((e) => PersonRespone.fromJson(e)).toList(),
      );

  List<People> toEntity() =>
      results
          ?.map((e) => People(
              id: e.id,
              totalPages: totalPages,
              name: e.name,
              profile: e.profilePath,
              popularity: e.popularity,
              knownForDepartment: e.knownForDepartment))
          .toList() ??
      [];

  @override
  List<Object?> get props => [
        page,
        results,
        totalPages,
        totalResults,
      ];
}

class PersonRespone extends Equatable {
  final bool? adult;
  final int? gender;
  final int id;
  final List<KnownFor>? knownFor;
  final String? knownForDepartment;
  final String? name;
  final double? popularity;
  final String? profilePath;
  final String? biography;
  final String? placeOfBirth;

  const PersonRespone({
    this.adult,
    this.gender,
    required this.id,
    this.knownFor,
    this.knownForDepartment,
    this.name,
    this.popularity,
    this.profilePath,
    this.biography,
    this.placeOfBirth,
  });

  People toEntity() => People(
      id: id,
      name: name,
      profile: profilePath,
      popularity: popularity,
      knownForDepartment: knownForDepartment,
      totalPages: 0,
      biography: biography,
      placeOfBirth: placeOfBirth);

  factory PersonRespone.fromJson(Map<String, dynamic> json) => PersonRespone(
        adult: json['adult'],
        gender: json['gender'],
        id: json['id'],
        knownFor: (json['known_for'] == null)
            ? []
            : (json['known_for'] as List).map((v) => KnownFor.fromJson(v)).toList(),
        knownForDepartment: json['known_for_department'],
        name: json['name'],
        popularity: json['popularity']?.toDouble(),
        profilePath: json['profile_path'],
        biography: json['biography'],
        placeOfBirth: json['place_of_birth'],
      );

  @override
  List<Object?> get props =>
      [adult, gender, id, knownFor, knownForDepartment, name, popularity, profilePath];
}

class KnownFor extends Equatable {
  final bool? adult;
  final List<int>? genreIds;
  final int? id;
  final String? mediaType;
  final String? originalLanguage;
  final String? originalTitle;
  final String? overview;
  final String? posterPath;
  final String? releaseDate;
  final String? title;
  final bool? video;
  final double? voteAverage;
  final int? voteCount;
  final String? backdropPath;
  final String? firstAirDate;
  final String? name;
  final List<String>? originCountry;
  final String? originalName;

  const KnownFor(
      {this.adult,
      this.genreIds,
      this.id,
      this.mediaType,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.posterPath,
      this.releaseDate,
      this.title,
      this.video,
      this.voteAverage,
      this.voteCount,
      this.backdropPath,
      this.firstAirDate,
      this.name,
      this.originCountry,
      this.originalName});

  factory KnownFor.fromJson(Map<String, dynamic> json) => KnownFor(
        adult: json['adult'],
        genreIds: (json['genre_ids'] == null) ? [] : json['genre_ids'].cast<int>(),
        id: json['id'],
        mediaType: json['media_type'],
        originalLanguage: json['original_language'],
        originalTitle: json['original_title'],
        overview: json['overview'],
        posterPath: json['poster_path'],
        releaseDate: json['release_date'],
        title: json['title'],
        video: json['video'],
        voteAverage: json['vote_average']?.toDouble(),
        voteCount: json['vote_count'],
        backdropPath: json['backdrop_path'],
        firstAirDate: json['first_air_date'],
        name: json['name'],
        originCountry: json['origin_country']?.cast<String>() ?? [],
        originalName: json['original_name'],
      );

  @override
  List<Object?> get props => [
        adult,
        genreIds,
        id,
        mediaType,
        originalLanguage,
        originalTitle,
        overview,
        posterPath,
        releaseDate,
        title,
        video,
        voteAverage,
        voteCount,
        backdropPath,
        firstAirDate,
        name,
        originCountry,
        originalName
      ];
}
