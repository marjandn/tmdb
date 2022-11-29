import 'package:equatable/equatable.dart';
import 'package:tmdb_prj/src/app/constants/constants.dart';
import 'package:tmdb_prj/src/domain/entities/movie.dart';

class Credits extends Equatable {
  final String _profilePath;
  String get profilePath => "${Constants.imageBasePath}$_profilePath";
  final String knownFor;
  final String name;

  const Credits(this._profilePath, this.name, this.knownFor);

  @override
  List<Object?> get props => [_profilePath, name];
}
