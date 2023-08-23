class UnsplashPhoto {
  final String regularImageUrl;
  final String rawImageUrl;
  final String fullImageUrl;
  final String smallImageUrl;
  final String thumbImageUrl;
  final String altDescription;
  final String description;
  final int likes;
  final String userName;
  final String userProfileImage;

  UnsplashPhoto({
    required this.regularImageUrl,
    required this.rawImageUrl,
    required this.fullImageUrl,
    required this.smallImageUrl,
    required this.thumbImageUrl,
    required this.altDescription,
    required this.description,
    required this.likes,
    required this.userName,
    required this.userProfileImage,
  });

  factory UnsplashPhoto.fromJson(Map<String, dynamic> json) {
    final urls = json['urls'];
    final user = json['user'];

    return UnsplashPhoto(
      regularImageUrl: urls['regular'],
      rawImageUrl: urls['raw'],
      fullImageUrl: urls['full'],
      smallImageUrl: urls['small'],
      thumbImageUrl: urls['thumb'],
      altDescription: json['alt_description'] ?? 'No Description Available',
      description: json['description'] ?? '',
      likes: json['likes'],
      userName: user['name'],
      userProfileImage: user['profile_image']['medium'], // Use 'medium' for profile image
    );
  }
}
