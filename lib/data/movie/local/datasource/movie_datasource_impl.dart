import 'package:injectable/injectable.dart';
import 'package:movie_list_app/data/movie/local/datasource/movie_datasource.dart';
import 'package:movie_list_app/data/database/app_db.dart';


@Singleton(as: MovieDataSourceLocal)
class MovieDataSourceLocalImpl extends MovieDataSourceLocal {
  final AppDatabase _database;

  MovieDataSourceLocalImpl(this._database);

  @override
  Stream<List<Movie>> watchFavoriteMovies() {
    return _database.movieDao.watchFavoriteMovies();
  }

  @override
  Future<void> addMovieInFavorites(Movie movie) async {
    await _database.movieDao.addMovieInFavorites(movie);
  }

  @override
  Future<void> deleteMovieFromFavorites(int filmId) async {
    await _database.movieDao.deleteMovieFromFavorites(filmId);
  }

  @override
  Future<Movie> movieAtFilmId(int filmId) async {
    return await _database.movieDao.movieAtFilmId(filmId);
  }

  @override
  Future<List<Movie>> movieAtName(String name) async {
    return await _database.movieDao.movieAtName(name);
  }
}
