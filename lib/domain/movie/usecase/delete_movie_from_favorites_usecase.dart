import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_list_app/domain/entity/entity.dart';
import 'package:movie_list_app/domain/movie/repository/movie_repository.dart';

@singleton
class DeleteMovieFromFavoritesUseCase {
  final MovieRepository _movieRepository;

  DeleteMovieFromFavoritesUseCase(this._movieRepository);

  Future<Either<Failure, Success>> call(int filmId) async {
    try {
      await _movieRepository.deleteMovieFromFavorites(filmId);
      return Right(Success(message: 'OK'));
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
