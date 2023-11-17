import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_list_app/domain/entity/entity.dart';
import 'package:movie_list_app/domain/movie/entity/movie.dart';
import 'package:movie_list_app/domain/movie/repository/movie_repository.dart';

@singleton
class FetchPopularMoviesWithQueryUseCase {
  final MovieRepository _movieRepository;

  FetchPopularMoviesWithQueryUseCase(this._movieRepository);

  Either<Failure, Future<List<MovieEntity>>> call(String keyword, int page) {
    try {
      return Right(_movieRepository.fetchPopularMoviesWithQuery(keyword, page));
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
