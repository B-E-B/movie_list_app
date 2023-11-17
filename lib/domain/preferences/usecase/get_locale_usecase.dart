import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_list_app/domain/entity/entity.dart';
import 'package:movie_list_app/domain/preferences/repository/preferences_repository.dart';

@injectable
class GetLocaleUseCase {
  final PreferencesRepository _preferencesRepository;

  GetLocaleUseCase(this._preferencesRepository);

  Either<Failure, Future<String>> call() {
    try {
      return Right(_preferencesRepository.getLocale());
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
