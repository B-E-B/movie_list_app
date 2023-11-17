import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

import 'package:movie_list_app/domain/movie/entity/movie.dart';
import 'package:movie_list_app/domain/movie/usecase/fetch_favorite_movie_at_id_usecase.dart';
import 'package:movie_list_app/domain/movie/usecase/fetch_popular_movie_at_id_usecase.dart';

@injectable
class SelectedMovieBloc {
  final List arguments;
  final int filmId;
  final bool isFavorited;
  final String nameRu;
  final String nameEn;

  final BehaviorSubject<MovieEntity> _selectedMovie = BehaviorSubject();

  final FetchPopularMovieAtIdUseCase _fetchPopularMovieAtIdUseCase;
  final FetchFavoriteMovieAtIdUseCase _fetchFavoriteMovieAtIdUseCase;

  StreamSubscription<MovieEntity>? _selctedMovieSubscription;
  Stream<MovieEntity> get selectedMovieStream => _selectedMovie.stream;

  SelectedMovieBloc(this._fetchPopularMovieAtIdUseCase, this._fetchFavoriteMovieAtIdUseCase,
      {@factoryParam required this.arguments})
      : filmId = arguments[0] as int,
        nameRu = arguments[1] as String,
        nameEn = arguments[2] as String,
        isFavorited = arguments[3] as bool {
    if (isFavorited == false) {
      fetchMovieApi(filmId);
    } else {
      fetchMovieDb(filmId);
    }
  }

  Future<void> fetchMovieApi(int filmId) async {
    _fetchPopularMovieAtIdUseCase(filmId).fold(
      (failure) {
        if (kDebugMode) {
          print(" ${failure.message}");
        }
      },
      (futureMovies) async {
        final movies = await futureMovies;
        _selectedMovie.add(movies);
      },
    );
  }

  Future<void> fetchMovieDb(int filmId) async {
    _fetchFavoriteMovieAtIdUseCase(filmId).fold(
      (failure) {
        if (kDebugMode) {
          print(" ${failure.message}");
        }
      },
      (futureMovies) async {
        final movies = await futureMovies;
        _selectedMovie.add(movies);
      },
    );
  }

  ImageProvider getPoster() {
    if (isFavorited == false) {
      return NetworkImage(_selectedMovie.value.posterUrl);
    } else {
      return CachedNetworkImageProvider(_selectedMovie.value.posterUrl);
    }
  }

  dispose() {
    _selctedMovieSubscription?.cancel();
    _selectedMovie.close();
  }
}
