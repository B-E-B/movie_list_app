import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_list_app/domain/entity/entity.dart';

import 'package:movie_list_app/domain/movie/entity/movie.dart';
import 'package:movie_list_app/domain/movie/usecase/add_movie_in_favorites_usecase.dart';
import 'package:movie_list_app/domain/movie/usecase/delete_movie_from_favorites_usecase.dart';
import 'package:movie_list_app/domain/movie/usecase/fetch_popular_movie_at_id_usecase.dart';
import 'package:movie_list_app/domain/movie/usecase/fetch_popular_movies_usecase.dart';
import 'package:movie_list_app/domain/movie/usecase/fetch_popular_movies_with_query_usecase.dart';
import 'package:movie_list_app/domain/movie/usecase/search_favorite_usecase.dart';
import 'package:movie_list_app/domain/movie/usecase/watch_favorited_movies_usecase.dart';
import 'package:movie_list_app/presentation/model/enum/movie_list_state.dart';
import 'package:rxdart/rxdart.dart';

@injectable
class MovieListBloc {
  final BehaviorSubject<List<MovieEntity>> _popularMovies = BehaviorSubject.seeded([]);
  final BehaviorSubject<List<MovieEntity>> _favoriteMovies = BehaviorSubject.seeded([]);
  final BehaviorSubject<List<MovieEntity>> _searchedMovies = BehaviorSubject.seeded([]);
  final BehaviorSubject<bool> _isFavoritedFlag = BehaviorSubject.seeded(false);
  final BehaviorSubject<MovieListState> _movieListState = BehaviorSubject.seeded(MovieListState.popular);
  final BehaviorSubject<String> _searchQuerySubject = BehaviorSubject<String>.seeded('');
  final BehaviorSubject<List<int>> _favoriteMoviesId = BehaviorSubject.seeded([]);

  StreamSubscription<List<MovieEntity>>? _favoriteMoviesSubscription;

  final SearchFavoriteUseCase _searchFavoriteUseCase;
  final FetchPopularMoviesUseCase _fetchPopularMoviesUseCase;
  final WatchFavoriteMoviesUseCase _watchFavoriteMoviesUseCase;
  final AddMovieInFavoritesUseCase _addMovieInFavoritesUseCase;
  final DeleteMovieFromFavoritesUseCase _deleteMovieFromFavoritesUseCase;
  final FetchPopularMovieAtIdUseCase _watchMovieAtIdUseCase;
  final FetchPopularMoviesWithQueryUseCase _fetchPopularMoviesWithQueryUseCase;

  final ScrollController _scrollController = ScrollController();
  final TextEditingController _searchController = TextEditingController();

  Stream<List<MovieEntity>> get popularMoviesStream => _popularMovies.stream;
  Stream<List<MovieEntity>> get favoriteMoviesStream => _favoriteMovies.stream;
  Stream<List<MovieEntity>> get searchedMoviesStream => _searchedMovies.stream;

  Stream<bool> get isFavoritedFlagStream => _isFavoritedFlag.stream;
  Stream<MovieListState> get movieListStateStream => _movieListState.stream;
  Stream<String> get searchQueryStream => _searchQuerySubject.stream;
  Stream<List<int>> get favoriteMoviesIdStream => _favoriteMoviesId.stream;

  List<MovieEntity> get popularMovieList => _popularMovies.value;
  List<MovieEntity> get favoriteMovieList => _favoriteMovies.value;
  List<MovieEntity> get searchedMovieList => _searchedMovies.value;

  ScrollController get scrollController => _scrollController;
  TextEditingController get searchController => _searchController;
  String get searchQuery => _searchController.text;

  int _currentPage = 1;
  int _currentPageForSearchQuery = 1;

  MovieListBloc(
    this._fetchPopularMoviesUseCase,
    this._watchFavoriteMoviesUseCase,
    this._addMovieInFavoritesUseCase,
    this._deleteMovieFromFavoritesUseCase,
    this._watchMovieAtIdUseCase,
    this._fetchPopularMoviesWithQueryUseCase,
    this._searchFavoriteUseCase,
  ) {
    _scrollController.addListener(_handleScroll);
    _searchController.addListener(_handleSearch);
    fetchPopularMovies(_currentPage);
    fetchFavoriteMovies();
  }

  Future<void> _handleScroll() async {
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 500) {
      await fetchNextPage();
    }
  }

  Future<void> _handleSearch() async {
    List<MovieEntity> standardMovies;
    _currentPageForSearchQuery = 1;
    String query = searchController.value.text.trim();
    _searchQuerySubject.add(query);

    _isFavoritedFlag.value == true
        ? {await searchFavorite(_searchQuerySubject.value), standardMovies = favoriteMovieList}
        : {await fetchPopularMoviesBySearchQuery(_searchQuerySubject.value, 1), standardMovies = popularMovieList};
    if
    (query.isEmpty)  _searchedMovies.add(standardMovies);
  }

  Future<void> fetchPopularMovies(int page) async {
    _fetchPopularMoviesUseCase(page).fold(
      (failure) {
        if (kDebugMode) {
          print(" ${failure.message}");
        }
      },
      (popularMovies) async {
        final movies = await popularMovies;
        if (_currentPage > 1) {
          _popularMovies.add(_popularMovies.value..addAll(movies));
        } else {
          _popularMovies.add(movies);
        }
      },
    );
  }

  Future<void> fetchFavoriteMovies() async {
    _watchFavoriteMoviesUseCase().fold((failure) {
      if (kDebugMode) {
        print(failure.message);
      }
    }, (favoriteMoviesStream) {
      _favoriteMoviesSubscription ??= favoriteMoviesStream.listen((movies) {
        _favoriteMovies.add(movies);
        _favoriteMoviesId.add((movies.map((movie) => movie.filmId)).toList());
      });
    });
  }

  Future<MovieEntity> fetchPopularMovieAtId(int filmId) async {
    return _watchMovieAtIdUseCase(filmId).fold(
      (failure) {
        if (kDebugMode) {
          print(" ${failure.message}");
        }
        throw Failure(message: "Failed to fetch movie at id: $filmId");
      },
      (futureMovie) async {
        final movie = await futureMovie;
        return movie;
      },
    );
  }

  Future<void> fetchPopularMoviesBySearchQuery(String searchText, int page) {
    return _fetchPopularMoviesWithQueryUseCase(searchText, page).fold(
      (failure) {
        if (kDebugMode) {
          print(" ${failure.message}");
        }
        throw Failure(message: "Failed to fetch movies by search query: '$searchText'");
      },
      (searchedMovies) async {
        final movies = await searchedMovies;
        if (_currentPageForSearchQuery > 1) {
          _searchedMovies.add(_searchedMovies.value..addAll(movies));
        } else {
          _searchedMovies.add(movies);
        }
      },
    );
  }

  Future<void> searchFavorite(String searchText) async {
    return _searchFavoriteUseCase(searchText).fold(
      (failure) {
        if (kDebugMode) {
          print(" ${failure.message}");
        }
        throw Failure(message: "Failed to fetch movies by search query: '$searchText'");
      },
      (searchedMovies) async {
        final movies = await searchedMovies;
        _searchedMovies.add(movies);
      },
    );
  }

  Future<void> fetchNextPage() async {
    if (_movieListState.value == MovieListState.popular) {
      _currentPage++;
      await fetchPopularMovies(_currentPage);
    } else if (_movieListState.value == MovieListState.search) {
      _currentPageForSearchQuery++;
      await fetchPopularMoviesBySearchQuery(searchQuery, _currentPageForSearchQuery);
    }
  }

  Future<void> reloadPopularMoviesPage() async {
    _currentPage = 1;
    await fetchPopularMovies(_currentPage);
  }

  Future<void> addFavoriteMovie(MovieEntity movie) async {
    MovieEntity newFavoriteMovie = await fetchPopularMovieAtId(movie.filmId);
    newFavoriteMovie = newFavoriteMovie.copyWith(nameEn: movie.nameEn, nameRu: movie.nameRu);

    await _addMovieInFavoritesUseCase(newFavoriteMovie);
    CachedNetworkImage(imageUrl: newFavoriteMovie.posterUrl);
    CachedNetworkImage(imageUrl: newFavoriteMovie.posterUrlPreview);
  }

  Future<void> deleteFavoriteMovie(MovieEntity movie) async {
    await _deleteMovieFromFavoritesUseCase(movie.filmId);

    CachedNetworkImage.evictFromCache(movie.posterUrl);
    CachedNetworkImage.evictFromCache(movie.posterUrlPreview);
  }

  Future<void> changeSection(bool isFavorited) async {
    _isFavoritedFlag.add(isFavorited);

    isFavorited ? _searchedMovies.add(favoriteMovieList) : _searchedMovies.add(popularMovieList);
  }

  bool isMovieFavorited(int filmId, {List<int> favoriteFilmId = const []}) {
    if (favoriteFilmId.isEmpty) {
      return _favoriteMovies.value.any((movie) => movie.filmId == filmId);
    } else {
      return favoriteFilmId.any((favoriteId) => favoriteId == filmId);
    }
  }

  ImageProvider getPoster(MovieEntity movie) {
    if (isMovieFavorited(movie.filmId) == false) {
      return NetworkImage(movie.posterUrlPreview);
    } else {
      return CachedNetworkImageProvider(movie.posterUrlPreview);
    }
  }

  void changeMovieListState(MovieListState newState) {
    _movieListState.add(newState);
  }

  void addPopularMoviesInSearch() {
    _searchedMovies.add(popularMovieList);
  }

  dispose() {
    _favoriteMoviesSubscription?.cancel();

    _popularMovies.close();
    _favoriteMovies.close();
    _isFavoritedFlag.close();
    _movieListState.close();
    _favoriteMoviesId.close();

    _scrollController.removeListener(_handleScroll);
    _searchController.removeListener(_handleSearch);

    _scrollController.dispose();
    _searchController.dispose();
  }
}
