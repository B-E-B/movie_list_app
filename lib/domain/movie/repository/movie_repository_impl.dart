import 'package:injectable/injectable.dart';
import 'package:movie_list_app/data/movie/local/datasource/movie_datasource.dart';
import 'package:movie_list_app/data/movie/remote/datasource/movie_datasource.dart';
import 'package:movie_list_app/domain/movie/entity/movie.dart';
import 'package:movie_list_app/domain/movie/mapper/movie_mapper.dart';
import 'package:movie_list_app/domain/movie/repository/movie_repository.dart';

@Singleton(as: MovieRepository)
class MovieRepositoryImpl extends MovieRepository with MovieMapper {
  final MovieDataSourceLocal _movieDataSourceLocal;
  final MovieDataSourceRemote _movieDataSourceRemote;
  
  MovieRepositoryImpl(
    this._movieDataSourceLocal,
    this._movieDataSourceRemote,
  );

  @override
  Future<List<MovieEntity>> fetchPopularMovies(int page) async {
    final moviesData = await _movieDataSourceRemote.fetchPopularMovies(page);
    final movies = moviesData
        .map((movie) => mapFromMovieJsonToMovieEntity(movie))
        .toList();
    return movies;
  }

  @override
  Future<MovieEntity> fetchPopularMovieAtId(int filmId) async {
    final moviesData = await _movieDataSourceRemote.fetchMovieAtId(filmId);
    final movie = mapFromMovieJsonToMovieEntity(moviesData);
    return movie;
  }

  @override
  Stream<List<MovieEntity>> watchFavoriteMovies() {
    final moviesData = _movieDataSourceLocal.watchFavoriteMovies();
    final movies = moviesData.map(
      (movies) => movies
          .map(
            (e) => mapDbToEntityMovie(e),
          )
          .toList(),
    );
    return movies;
  }

  @override
  Future<MovieEntity> fetchFavoriteMovieAtId(int filmId) async {
    final moviesData = await _movieDataSourceLocal.movieAtFilmId(filmId);
    final movie = mapDbToEntityMovie(moviesData);
    return movie;
  }

  @override
  Future<List<MovieEntity>> fetchPopularMoviesWithQuery(String keyword, int page) async {
    final moviesData = await _movieDataSourceRemote.fetchPopularMoviesWithQuery(keyword, page);
    final movies = moviesData.map((movie) => mapFromMovieJsonToMovieEntity(movie)).toList();
    return movies;
  }

  @override
  Future<void> addMovieInFavorites(MovieEntity movie) async {
    await _movieDataSourceLocal.addMovieInFavorites(mapEntityToDbMovie(movie));
  }

  @override
  Future<void> deleteMovieFromFavorites(int filmId) async {
    await _movieDataSourceLocal.deleteMovieFromFavorites(filmId);
  }
  @override
  Future<List<MovieEntity>> movieAtName(String name) async {
    final moviesData = await _movieDataSourceLocal.movieAtName(name);
    final movie = moviesData.map((movie) => mapDbToEntityMovie(movie)).toList();
    return movie;
  }
}
