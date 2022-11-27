import 'package:tmdb_prj/src/app/constants/constants.dart';

// todo: Transform all picture path field of classes to full imag address like this
class MovieDetails {
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
  final List<String> spokenLanguages;
  final String overview;
  final List<ProductionCompany> productionCompanies;

  MovieDetails({
    required String posterPath,
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
  }) : _posterPath = posterPath;
}

class ProductionCompany {
  final String _logoPath;
  String get logoPath => "${Constants.imageBasePath}$_logoPath";
  final String name;

  ProductionCompany({required String logoPath, required this.name}) : _logoPath = logoPath;
}
