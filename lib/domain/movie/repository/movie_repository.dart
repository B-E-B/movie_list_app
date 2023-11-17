import 'package:movie_list_app/domain/movie/entity/movie.dart';

abstract class MovieRepository {
  Future<List<MovieEntity>> fetchPopularMovies(int page);
  Stream<List<MovieEntity>> watchFavoriteMovies();
  Future<List<MovieEntity>> fetchPopularMoviesWithQuery(String keyword, int page);
  Future<MovieEntity> fetchPopularMovieAtId(int filmId);
  Future<MovieEntity> fetchFavoriteMovieAtId(int filmId);
  Future<void> addMovieInFavorites(MovieEntity movie);
  Future<void> deleteMovieFromFavorites(int filmId);
  Future<List<MovieEntity>> movieAtName(String name);
}
