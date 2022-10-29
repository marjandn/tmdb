import 'package:equatable/equatable.dart';

class People extends Equatable {
  final String? name;
  final String? profilePath;
  final double? popularity;
  final String? knownForDepartment;
  final int? totalPages;

  const People(
      {this.name, this.profilePath, this.popularity, this.knownForDepartment, this.totalPages});

  @override
  List<Object?> get props => [name, profilePath];
}
