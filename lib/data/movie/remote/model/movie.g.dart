// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movie _$MovieFromJson(Map<String, dynamic> json) => Movie(
      json['description'] as String?,
      filmId: json['filmId'] as int,
      nameRu: json['nameRu'] as String?,
      nameEn: json['nameEn'] as String?,
      year: json['year'] as String?,
      countries: Movie._stringListFromJson(json['countries'] as List),
      genres: Movie._stringListFromJson(json['genres'] as List),
      posterUrl: json['posterUrl'] as String,
      posterUrlPreview: json['posterUrlPreview'] as String,
    );

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
      'filmId': instance.filmId,
      'nameRu': instance.nameRu,
      'nameEn': instance.nameEn,
      'year': instance.year,
      'countries': instance.countries,
      'genres': instance.genres,
      'posterUrl': instance.posterUrl,
      'posterUrlPreview': instance.posterUrlPreview,
      'description': instance.description,
    };
