
import 'package:movie_list_app/data/movie/remote/model/movie.dart';
import 'package:movie_list_app/data/database/app_db.dart' as db;
import 'package:movie_list_app/domain/movie/entity/movie.dart' as entity;
import 'package:translit/translit.dart';

mixin MovieMapper {
  entity.MovieEntity mapFromMovieJsonToMovieEntity(Movie movie) {
    return entity.MovieEntity(
      description: movie.description ?? 'Описание фильма отсутствует',
      filmId: movie.filmId,
      nameRu: movie.nameRu ?? Translit().unTranslit(source: movie.nameEn ?? 'Без названия'),
      nameEn: movie.nameEn ?? Translit().toTranslit(source: movie.nameRu ?? 'No name'),
      year: movie.year ?? '',
      countries: List<String>.from(movie.countries),
      genres: List<String>.from(movie.genres),
      posterUrl: movie.posterUrl,
      posterUrlPreview: movie.posterUrlPreview,
    );
  }

  db.Movie mapEntityToDbMovie(entity.MovieEntity movie) {
    return db.Movie(
      filmId: movie.filmId,
      nameRu: movie.nameRu,
      nameEn: movie.nameEn,
      year: movie.year,
      countries: movie.countries.join(', '),
      genres: movie.genres.join(', '),
      posterUrl: movie.posterUrl,
      posterUrlPreview: movie.posterUrlPreview,
      description: movie.description,
    );
  }

  entity.MovieEntity mapDbToEntityMovie(db.Movie movie) {
    return entity.MovieEntity(
      filmId: movie.filmId,
      nameRu: movie.nameRu,
      nameEn: movie.nameEn,
      year: movie.year,
      countries: _listStringToString(movie.countries),
      genres: _listStringToString(movie.genres),
      posterUrl: movie.posterUrl,
      posterUrlPreview: movie.posterUrlPreview,
      description: movie.description,
    );
  }

  List<String> _listStringToString(String string) {
    return string.split(', ').map((e) => e.trim()).toList();
  }
}
