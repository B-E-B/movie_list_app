import 'package:movie_list_app/data/movie/remote/model/movie.dart';

abstract class MovieDataSourceRemote {

  Future<List<Movie>> fetchPopularMovies(int page);
  Future<Movie> fetchMovieAtId(int filmId);
  Future<List<Movie>> fetchPopularMoviesWithQuery(String keyword, int page);
}
