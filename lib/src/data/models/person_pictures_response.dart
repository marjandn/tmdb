class PersonPicturesResponnse {
  final List<PictureItemResponse> profiles;

  PersonPicturesResponnse(this.profiles);

  factory PersonPicturesResponnse.fromJson(Map<String, dynamic> json) =>
      PersonPicturesResponnse(json['profiles']);

  List<String> toEntity() => profiles.map((e) => e.picturePath).toList();
}

class PictureItemResponse {
  final String picturePath;

  PictureItemResponse(this.picturePath);

  factory PictureItemResponse.fromJson(Map<String, dynamic> json) =>
      PictureItemResponse(json['file_path']);
}
