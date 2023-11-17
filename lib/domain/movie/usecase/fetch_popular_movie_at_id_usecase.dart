import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_list_app/domain/entity/entity.dart';
import 'package:movie_list_app/domain/movie/entity/movie.dart';
import 'package:movie_list_app/domain/movie/repository/movie_repository.dart';

@singleton
class FetchPopularMovieAtIdUseCase {
  final MovieRepository _movieRepository;

  FetchPopularMovieAtIdUseCase(this._movieRepository);

  Either<Failure, Future<MovieEntity>> call(int filmId) {
    try {
      return Right(_movieRepository.fetchPopularMovieAtId(filmId));
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
