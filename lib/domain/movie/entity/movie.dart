class MovieEntity {
  final int filmId;
  final String nameRu;
  final String nameEn;
  final String year;
  final List<String> countries;
  final List<String> genres;
  final String posterUrl;
  final String posterUrlPreview;
  final String description;

  MovieEntity({
    required this.filmId,
    required this.nameRu,
    required this.nameEn,
    required this.year,
    required this.countries,
    required this.genres,
    required this.posterUrl,
    required this.posterUrlPreview,
    required this.description,
  });

  MovieEntity copyWith({filmId, nameRu, nameEn, year, countries, genres, posterUrl, posterUrlPreview, description}) =>
      MovieEntity(
        filmId: filmId ?? this.filmId,
        nameRu: nameRu ?? this.nameRu,
        nameEn: nameEn ?? this.nameEn,
        year: year ?? this.year,
        countries: countries ?? this.countries,
        genres: genres ?? this.genres,
        posterUrl: posterUrl ?? this.posterUrl,
        posterUrlPreview: posterUrlPreview ?? this.posterUrlPreview,
        description: description ?? this.description,
      );
}
