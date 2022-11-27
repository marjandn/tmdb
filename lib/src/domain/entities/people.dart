import 'package:equatable/equatable.dart';

class People extends Equatable {
  final String? name;
  final String? profilePath;
  final double? popularity;
  final String? knownForDepartment;
  final int? totalPages;
  final String? biography;
  final String? placeOfBirth;

  const People(
      {this.name,
      this.profilePath,
      this.popularity,
      this.knownForDepartment,
      this.totalPages,
      this.biography,
      this.placeOfBirth});

  @override
  List<Object?> get props => [name, profilePath];
}
