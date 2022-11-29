class PersonPicturesResponnse {
  final List<PictureItemResponse> profiles;

  PersonPicturesResponnse(this.profiles);

  factory PersonPicturesResponnse.fromJson(Map<String, dynamic> json) => PersonPicturesResponnse(
        (json['profiles'] == null)
            ? []
            : (json['profiles'] as List).map((e) => PictureItemResponse.fromJson(e)).toList(),
      );

  List<String> toEntity() => profiles.map((e) => e.picturePath).toList();
}

class PictureItemResponse {
  final String picturePath;

  PictureItemResponse(this.picturePath);

  factory PictureItemResponse.fromJson(Map<String, dynamic> json) =>
      PictureItemResponse(json['file_path']);
}
