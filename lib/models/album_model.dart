import 'package:equatable/equatable.dart';

class AlbumModel extends Equatable {
  const AlbumModel({
    required this.almbunId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  final int almbunId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  factory AlbumModel.formApiResponse(Map<String, dynamic> json) => AlbumModel(
        almbunId: json['albumId'] as int,
        id: json['id'] as int,
        title: json['title'] as String,
        url: json['url'] as String,
        thumbnailUrl: json['thumbnailUrl'] as String,
      );

  @override
  List<Object?> get props => [
        almbunId,
        id,
        title,
        url,
        thumbnailUrl,
      ];
}
