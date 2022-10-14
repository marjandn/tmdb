import 'package:equatable/equatable.dart';
import 'package:tmdb_prj/src/domain/entities/genre.dart';

class GenreResponse extends Genre {
  final int? jId;

  const GenreResponse({
    this.jId,
  }) : super(id: jId);

  factory GenreResponse.fromJson(Map<String, dynamic> json) {
    return GenreResponse(jId: json['']);
  }

  @override
  List<Object?> get props => [
        jId,
      ];
}
