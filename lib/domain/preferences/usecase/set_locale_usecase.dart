import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_list_app/domain/entity/entity.dart';
import 'package:movie_list_app/domain/preferences/repository/preferences_repository.dart';

@injectable
class SetLocaleUseCase {
  final PreferencesRepository _preferencesRepository;

  SetLocaleUseCase(this._preferencesRepository);

  Future<Either<Failure, Success>> call(String locale) async {
    try {
      await _preferencesRepository.setLocale(locale);
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
