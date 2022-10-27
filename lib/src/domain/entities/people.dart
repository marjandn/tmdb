import 'package:equatable/equatable.dart';

class People extends Equatable {
  final String? name;
  final String? profilePath;

  const People({this.name, this.profilePath});

  @override
  List<Object?> get props => [name, profilePath];
}
