import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:tmdb_prj/src/domain/entities/genre.dart';

class GenreResponse extends Equatable {
  final List<GenreItemResponse> genresesList;

  const GenreResponse({
    required this.genresesList,
  });

  factory GenreResponse.fromJson(Map<String, dynamic> json) {
    return GenreResponse(
        genresesList: (json['genres'] as List<dynamic>?)
                ?.map((e) => GenreItemResponse.fromJson(e))
                .toList() ??
            []);
  }

  @override
  List<Object?> get props => [
        genresesList,
      ];

  List<Genre> toEntity() => genresesList.map((e) => Genre(id: e.id, name: e.name)).toList();
}

class GenreItemResponse extends Equatable {
  final int? id;
  final String? name;

  const GenreItemResponse({this.id, this.name});

  factory GenreItemResponse.fromJson(Map<String, dynamic> json) {
    return GenreItemResponse(id: json['id'], name: json['name']);
  }

  @override
  List<Object?> get props => [id, name];
}
