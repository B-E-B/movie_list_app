import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_list_app/domain/entity/entity.dart';
import 'package:movie_list_app/domain/movie/entity/movie.dart';
import 'package:movie_list_app/domain/movie/repository/movie_repository.dart';

@singleton
class WatchFavoriteMoviesUseCase {
  final MovieRepository _movieRepository;

  WatchFavoriteMoviesUseCase(this._movieRepository);

  Either<Failure, Stream<List<MovieEntity>>> call() {
    try {
      return Right(_movieRepository.watchFavoriteMovies());
    } catch (e, s) {
      return Left(
        Failure(
          exception: e,
          stackTrace: s,
          message: e.toString(),
        ),
      );
    }
  }
}
