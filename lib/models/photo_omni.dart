import 'package:photos_omni/config/config_imports.dart';

class PhotoOmni {
  final String id;
  final String albumId;
  final String title;
  final String url;
  final String thumbnailUrl;

  PhotoOmni({
    required this.id,
    required this.albumId,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  factory PhotoOmni.fromMap({required Map map}) {
    return PhotoOmni(
      id: '${map['id'] ?? AppStrings.voidText}',
      albumId: '${map['albumId'] ?? AppStrings.voidText}',
      title: map['title'] ?? AppStrings.voidText,
      url: map['url'] ?? AppStrings.voidText,
      thumbnailUrl: map['thumbnailUrl'] ?? AppStrings.voidText,
    );
  }
}
