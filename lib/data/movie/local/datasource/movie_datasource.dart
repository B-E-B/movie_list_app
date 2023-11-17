import 'package:movie_list_app/data/database/app_db.dart';

abstract class MovieDataSourceLocal {
  Stream<List<Movie>> watchFavoriteMovies();
  Future<void> addMovieInFavorites(Movie movie);
  Future<void> deleteMovieFromFavorites(int filmId);
  Future<Movie> movieAtFilmId(int filmId);
  Future<List<Movie>> movieAtName(String name);
}
