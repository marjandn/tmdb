import 'package:tmdb_prj/src/app/constants/constants.dart';

import 'movie_details.dart';

class TvshowDetails {
  final String _posterPath;
  String get psoterPath => "${Constants.imageBasePath}$_posterPath";

  final String voteAvg;
  final int voteCount;
  final String status;
  final String originalTitle;
  final String releaseDate;
  final List<String> productionCounties;
  final int runtime;
  final List<String> genres;
  final List<Seasons> seasons;
  final List<String> spokenLanguages;
  final String overview;
  final List<ProductionCompany> productionCompanies;

  TvshowDetails(
      {required String posterPath,
      required this.voteAvg,
      required this.voteCount,
      required this.status,
      required this.originalTitle,
      required this.releaseDate,
      required this.productionCounties,
      required this.runtime,
      required this.genres,
      required this.spokenLanguages,
      required this.overview,
      required this.productionCompanies,
      required this.seasons})
      : _posterPath = posterPath;
}

class Seasons {
  final String name;
  final String overview;

  final String _posterPath;
  String get posterPath => "${Constants.imageBasePath}$_posterPath";

  Seasons({required this.name, required this.overview, required String poster})
      : _posterPath = poster;
}
