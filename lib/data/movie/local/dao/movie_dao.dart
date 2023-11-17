import 'package:drift/drift.dart';
import 'package:movie_list_app/data/database/app_db.dart';
import 'package:movie_list_app/data/movie/local/table/movies.dart';


part 'movie_dao.g.dart';

@DriftAccessor(
  tables: [Movies],
)
class MovieDao extends DatabaseAccessor<AppDatabase> with _$MovieDaoMixin {
  MovieDao(AppDatabase db) : super(db);

  Stream<List<Movie>> watchFavoriteMovies() {
    return select(movies).watch();
  }

  Future<int> addMovieInFavorites(Movie movie) async {
    return await into(movies).insert(movie);
  }

  Future<void> deleteMovieFromFavorites(int id) async {
    await (delete(movies)..where((tbl) => tbl.filmId.equals(id))).go();
  }

  Future<Movie> movieAtFilmId(int filmId) async {
    final query = select(movies)..where((tbl) => tbl.filmId.equals(filmId));
    final movie = await query.getSingle();

    return movie;
  }

  Future<List<Movie>> movieAtName(String name) async {
    final query = select(movies)..where((tbl) => tbl.nameRu.regexp(name, caseSensitive: false));
    final movie = await query.get();

    return movie;
  }
}
