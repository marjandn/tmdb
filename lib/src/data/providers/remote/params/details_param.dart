// todo: Move all params class in remote/params directory

class MovieDetailsParam {
  final int movieId;

  MovieDetailsParam({required this.movieId});

  Map<String, dynamic> toJson() => {'movie_id': movieId};
}

class PersonDetailsParam {
  final int personId;

  PersonDetailsParam({required this.personId});
}
