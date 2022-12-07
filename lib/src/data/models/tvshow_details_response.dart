import 'package:tmdb_prj/src/data/models/genre_response.dart';
import 'package:tmdb_prj/src/data/models/movie_details_response.dart';
import 'package:tmdb_prj/src/domain/entities/movie_details.dart';

import '../../domain/entities/tvshow_details.dart';

class TvshowDetailsResponse {
  final bool? adult;
  final String? backdrop_path;
  final int? budget;
  final List<GenreItemResponse>? genres;
  final String? homepage;
  final int? id;
  final String? imdb_id;
  final String? original_language;
  final String? original_title;
  final String? overview;
  final double? popularity;
  final String? poster_path;
  final List<ProductionCompanyResponse>? production_companies;
  final List<ProductionCountry>? production_countries;
  final String? release_date;
  final int? revenue;
  final int? runtime;
  final List<SpokenLanguage>? spoken_languages;
  final String? status;
  final String? tagline;
  final String? title;
  final double? vote_average;
  final int? vote_count;
  final List<SeasonsResponse> seasons;

  const TvshowDetailsResponse(
      this.adult,
      this.backdrop_path,
      this.budget,
      this.genres,
      this.homepage,
      this.id,
      this.imdb_id,
      this.original_language,
      this.original_title,
      this.overview,
      this.popularity,
      this.poster_path,
      this.production_companies,
      this.production_countries,
      this.release_date,
      this.revenue,
      this.runtime,
      this.spoken_languages,
      this.status,
      this.tagline,
      this.title,
      this.vote_average,
      this.vote_count,
      this.seasons);

  factory TvshowDetailsResponse.fromJson(Map<String, dynamic> json) => TvshowDetailsResponse(
        json['adult'],
        json['backdrop_path'],
        json['budget'],
        json['genres'] == null
            ? []
            : (json['genres'] as List<dynamic>).map((e) => GenreItemResponse.fromJson(e)).toList(),
        json['homepage'],
        json['id'],
        json['imdb_id'],
        json['original_language'],
        json['original_title'],
        json['overview'],
        json['popularity'],
        json['poster_path'],
        json['production_companies'] == null
            ? []
            : (json['production_companies'] as List<dynamic>)
                .map((e) => ProductionCompanyResponse.fromJson(e))
                .toList(),
        json['production_countries'] == null
            ? []
            : (json['production_countries'] as List<dynamic>)
                .map((e) => ProductionCountry.fromJson(e))
                .toList(),
        json['first_air_date'],
        json['revenue'],
        json['runtime'],
        json['spoken_languages'] == null
            ? []
            : (json['spoken_languages'] as List<dynamic>)
                .map((e) => SpokenLanguage.fromJson(e))
                .toList(),
        json['status'],
        json['tagline'],
        json['name'],
        json['vote_average'],
        json['vote_count'],
        json['seasons'] == null
            ? []
            : (json['seasons'] as List<dynamic>).map((e) => SeasonsResponse.fromJson(e)).toList(),
      );

  TvshowDetails toEntity() => TvshowDetails(
        posterPath: poster_path ?? "",
        voteAvg: vote_average.toString(),
        voteCount: vote_count ?? 0,
        status: status.toString(),
        originalTitle: title.toString(),
        releaseDate: release_date.toString(),
        productionCounties: production_countries!.map((e) => e.name).toList(),
        runtime: runtime ?? 0,
        genres: genres!.map((e) => e.name.toString()).toList(),
        spokenLanguages: spoken_languages!.map((e) => e.name).toList(),
        overview: overview.toString(),
        productionCompanies: production_companies!
            .where((element) => element.logo_path != null && element.logo_path!.isNotEmpty)
            .map((e) => ProductionCompany(logoPath: e.logo_path!, name: e.name))
            .toList(),
        seasons: seasons
            .map((e) => Seasons(name: e.name, overview: e.overview, poster: e.posterPath))
            .toList(),
      );
}

class SeasonsResponse {
  final String airDate;
  final int episodCount;
  final int id;
  final String name;
  final String overview;
  final String posterPath;
  final int sessionNumber;

  SeasonsResponse(this.airDate, this.episodCount, this.id, this.name, this.overview,
      this.posterPath, this.sessionNumber);

  factory SeasonsResponse.fromJson(Map<String, dynamic> json) => SeasonsResponse(
      json['air_date'],
      json['episode_count'],
      json['id'],
      json['name'],
      json['overview'],
      json['poster_path'],
      json['season_number']);
}
