// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i16;

import '../data/auth/datasource/auth_datasource.dart' as _i3;
import '../data/auth/datasource/auth_datasource_impl.dart' as _i4;
import '../data/database/app_db.dart' as _i10;
import '../data/movie/local/datasource/movie_datasource.dart' as _i8;
import '../data/movie/local/datasource/movie_datasource_impl.dart' as _i9;
import '../data/movie/remote/datasource/movie_datasource.dart' as _i11;
import '../data/movie/remote/datasource/movie_datasource_impl.dart' as _i12;
import '../data/preferences/preferences_datasource.dart' as _i27;
import '../data/preferences/preferences_datasource_impl.dart' as _i28;
import '../domain/auth/repository/auth_repository.dart' as _i5;
import '../domain/auth/repository/auth_repository_impl.dart' as _i6;
import '../domain/auth/usecase/login_usecase.dart' as _i7;
import '../domain/auth/usecase/signup_usecase.dart' as _i17;
import '../domain/movie/repository/movie_repository.dart' as _i13;
import '../domain/movie/repository/movie_repository_impl.dart' as _i14;
import '../domain/movie/usecase/add_movie_in_favorites_usecase.dart' as _i19;
import '../domain/movie/usecase/delete_movie_from_favorites_usecase.dart'
    as _i21;
import '../domain/movie/usecase/fetch_favorite_movie_at_id_usecase.dart'
    as _i22;
import '../domain/movie/usecase/fetch_popular_movie_at_id_usecase.dart' as _i23;
import '../domain/movie/usecase/fetch_popular_movies_usecase.dart' as _i24;
import '../domain/movie/usecase/fetch_popular_movies_with_query_usecase.dart'
    as _i25;
import '../domain/movie/usecase/search_favorite_usecase.dart' as _i15;
import '../domain/movie/usecase/watch_favorited_movies_usecase.dart' as _i18;
import '../domain/preferences/repository/preferences_repository.dart' as _i29;
import '../domain/preferences/repository/preferences_repository_impl.dart'
    as _i30;
import '../domain/preferences/usecase/get_locale_usecase.dart' as _i34;
import '../domain/preferences/usecase/set_locale_usecase.dart' as _i32;
import '../presentation/bloc/auth/authorization_screen_bloc.dart' as _i20;
import '../presentation/bloc/auth/signup_screen_bloc.dart' as _i33;
import '../presentation/bloc/movie/movie_list_bloc.dart' as _i26;
import '../presentation/bloc/movie/selected_movie_bloc.dart' as _i31;
import '../presentation/bloc/settings/locale_bloc.dart' as _i35;
import 'register_module.dart' as _i36;

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// initializes the registration of main-scope dependencies inside of GetIt
Future<_i1.GetIt> $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final registerModule = _$RegisterModule();
  gh.singleton<_i3.AuthDataSource>(_i4.AuthDataSourceImpl());
  gh.singleton<_i5.AuthRepository>(
      _i6.AuthRepositoryImpl(gh<_i3.AuthDataSource>()));
  gh.singleton<_i7.LogInUseCase>(_i7.LogInUseCase(gh<_i5.AuthRepository>()));
  gh.singleton<_i8.MovieDataSourceLocal>(
      _i9.MovieDataSourceLocalImpl(gh<_i10.AppDatabase>()));
  gh.singleton<_i11.MovieDataSourceRemote>(_i12.MovieDataSourceRemoteImpl());
  gh.singleton<_i13.MovieRepository>(_i14.MovieRepositoryImpl(
    gh<_i8.MovieDataSourceLocal>(),
    gh<_i11.MovieDataSourceRemote>(),
  ));
  gh.singleton<_i15.SearchFavoriteUseCase>(
      _i15.SearchFavoriteUseCase(gh<_i13.MovieRepository>()));
  await gh.factoryAsync<_i16.SharedPreferences>(
    () => registerModule.prefs,
    preResolve: true,
  );
  gh.singleton<_i17.SignUpUseCase>(
      _i17.SignUpUseCase(gh<_i5.AuthRepository>()));
  gh.singleton<_i18.WatchFavoriteMoviesUseCase>(
      _i18.WatchFavoriteMoviesUseCase(gh<_i13.MovieRepository>()));
  gh.singleton<_i19.AddMovieInFavoritesUseCase>(
      _i19.AddMovieInFavoritesUseCase(gh<_i13.MovieRepository>()));
  gh.factory<_i20.AuthorizationScreenBloc>(
      () => _i20.AuthorizationScreenBloc(gh<_i7.LogInUseCase>()));
  gh.singleton<_i21.DeleteMovieFromFavoritesUseCase>(
      _i21.DeleteMovieFromFavoritesUseCase(gh<_i13.MovieRepository>()));
  gh.singleton<_i22.FetchFavoriteMovieAtIdUseCase>(
      _i22.FetchFavoriteMovieAtIdUseCase(gh<_i13.MovieRepository>()));
  gh.singleton<_i23.FetchPopularMovieAtIdUseCase>(
      _i23.FetchPopularMovieAtIdUseCase(gh<_i13.MovieRepository>()));
  gh.singleton<_i24.FetchPopularMoviesUseCase>(
      _i24.FetchPopularMoviesUseCase(gh<_i13.MovieRepository>()));
  gh.singleton<_i25.FetchPopularMoviesWithQueryUseCase>(
      _i25.FetchPopularMoviesWithQueryUseCase(gh<_i13.MovieRepository>()));
  gh.factory<_i26.MovieListBloc>(() => _i26.MovieListBloc(
        gh<_i24.FetchPopularMoviesUseCase>(),
        gh<_i18.WatchFavoriteMoviesUseCase>(),
        gh<_i19.AddMovieInFavoritesUseCase>(),
        gh<_i21.DeleteMovieFromFavoritesUseCase>(),
        gh<_i23.FetchPopularMovieAtIdUseCase>(),
        gh<_i25.FetchPopularMoviesWithQueryUseCase>(),
        gh<_i15.SearchFavoriteUseCase>(),
      ));
  gh.singleton<_i27.PreferencesDataSource>(
      _i28.PreferencesDataSourceImpl(gh<_i16.SharedPreferences>()));
  gh.singleton<_i29.PreferencesRepository>(
      _i30.PreferencesRepositoryImpl(gh<_i27.PreferencesDataSource>()));
  gh.factoryParam<_i31.SelectedMovieBloc, List<dynamic>, dynamic>((
    arguments,
    _,
  ) =>
      _i31.SelectedMovieBloc(
        gh<_i23.FetchPopularMovieAtIdUseCase>(),
        gh<_i22.FetchFavoriteMovieAtIdUseCase>(),
        arguments: arguments,
      ));
  gh.factory<_i32.SetLocaleUseCase>(
      () => _i32.SetLocaleUseCase(gh<_i29.PreferencesRepository>()));
  gh.factory<_i33.SignUpScreenBloc>(
      () => _i33.SignUpScreenBloc(gh<_i17.SignUpUseCase>()));
  gh.factory<_i34.GetLocaleUseCase>(
      () => _i34.GetLocaleUseCase(gh<_i29.PreferencesRepository>()));
  gh.factory<_i35.LocaleBloc>(() => _i35.LocaleBloc(
        gh<_i34.GetLocaleUseCase>(),
        gh<_i32.SetLocaleUseCase>(),
      ));
  return getIt;
}

class _$RegisterModule extends _i36.RegisterModule {}
