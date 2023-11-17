import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_list_app/domain/entity/entity.dart';
import 'package:movie_list_app/domain/movie/entity/movie.dart';
import 'package:movie_list_app/domain/movie/repository/movie_repository.dart';

@singleton
class AddMovieInFavoritesUseCase {
  final MovieRepository _movieRepository;

  AddMovieInFavoritesUseCase(this._movieRepository);

  Future<Either<Failure, Success>> call(MovieEntity movie) async {
    try {
      await _movieRepository.addMovieInFavorites(movie);
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
