import 'package:equatable/equatable.dart';
import 'package:tmdb_prj/src/app/constants/constants.dart';

class People extends Equatable {
  final int id;
  final String? name;
  final String? _profilePath;
  String get profilePath => "${Constants.imageBasePath}$_profilePath";

  final double? popularity;
  final String? knownForDepartment;
  final int? totalPages;
  final String? biography;
  final String? placeOfBirth;

  const People(
      {required this.id,
      this.name,
      String? profile,
      this.popularity,
      this.knownForDepartment,
      this.totalPages,
      this.biography,
      this.placeOfBirth})
      : _profilePath = profile;

  @override
  List<Object?> get props => [name, profilePath];
}
