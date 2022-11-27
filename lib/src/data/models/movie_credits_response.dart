import 'package:tmdb_prj/src/domain/entities/movie_credits.dart';

class MovieCreditsResponse {
  final List<CastResponse> cast;
  final List<CrewResponse> crew;

  MovieCreditsResponse(this.cast, this.crew);

  factory MovieCreditsResponse.fromJson(Map<String, dynamic> json) => MovieCreditsResponse(
        json['cast'] == null
            ? []
            : (json['cast'] as List).map((e) => CastResponse.fromJson(e)).toList(),
        json['crew'] == null
            ? []
            : (json['crew'] as List).map((e) => CrewResponse.fromJson(e)).toList(),
      );

  List<MovieCredits> toEntity() => cast
      .where((element) => element.profile_path != null && element.profile_path!.isNotEmpty)
      .map((e) => MovieCredits(e.profile_path!, e.name, e.known_for_department))
      .toList()
    ..addAll(crew
        .where((element) => element.profile_path != null && element.profile_path!.isNotEmpty)
        .map((e) => MovieCredits(e.profile_path!, e.name, e.known_for_department))
        .toList());
}

class CastResponse {
  final String name;
  final String known_for_department;
  final String? profile_path;

  CastResponse({
    required this.name,
    required this.known_for_department,
    required this.profile_path,
  });

  factory CastResponse.fromJson(Map<String, dynamic> json) => CastResponse(
        name: json['name'],
        profile_path: json['profile_path'],
        known_for_department: json['known_for_department'],
      );
}

class CrewResponse {
  final String name;
  final String known_for_department;
  final String? profile_path;

  CrewResponse(
      {required this.name, required this.known_for_department, required this.profile_path});

  factory CrewResponse.fromJson(Map<String, dynamic> json) => CrewResponse(
        name: json['name'],
        profile_path: json['profile_path'],
        known_for_department: json['known_for_department'],
      );
}
