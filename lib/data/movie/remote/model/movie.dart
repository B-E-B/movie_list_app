import 'package:json_annotation/json_annotation.dart';

part 'movie.g.dart';

@JsonSerializable()
class Movie {
  final int filmId;
  final String? nameRu;
  final String? nameEn;
  final String? year;

  @JsonKey(fromJson: _stringListFromJson)
  final List<String> countries;

  @JsonKey(fromJson: _stringListFromJson)
  final List<String> genres;

  final String posterUrl;
  final String posterUrlPreview;

  final String? description;

  Movie(
    this.description, {
    required this.filmId,
    required this.nameRu,
    required this.nameEn,
    required this.year,
    required this.countries,
    required this.genres,
    required this.posterUrl,
    required this.posterUrlPreview,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  factory Movie.customFromJson(Map<String, dynamic> json) => Movie(
        json['description'] as String?,
        filmId: json['kinopoiskId'] as int,
        nameRu: json['nameRu'] as String?,
        nameEn: json['nameEn'] as String?,
        year: json['year'].toString(),
        countries: Movie._stringListFromJson(json['countries'] as List),
        genres: Movie._stringListFromJson(json['genres'] as List),
        posterUrl: json['posterUrl'] as String,
        posterUrlPreview: json['posterUrlPreview'] as String,
      );

  Map<String, dynamic> toJson() => _$MovieToJson(this);

  static List<String> _stringListFromJson(List<dynamic> jsonList) {
    return jsonList.map((item) => item.values.first).toList().cast<String>();
  }
}
