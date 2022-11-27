class MoviePicturesResponse {
  final List<PosterResponse> posters;

  MoviePicturesResponse(this.posters);

  factory MoviePicturesResponse.fromJson(Map<String, dynamic> json) {
    return MoviePicturesResponse(json['posters'] == null
        ? []
        : (json['posters'] as List).map((e) => PosterResponse.fromJson(e)).toList());
  }

  List<String> toEnity() => posters.map((e) => e.file_path).toList();
}

class PosterResponse {
  final String file_path;

  PosterResponse(this.file_path);

  factory PosterResponse.fromJson(Map<String, dynamic> json) => PosterResponse(json['file_path']);
}
