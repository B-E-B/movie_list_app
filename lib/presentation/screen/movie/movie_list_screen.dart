import 'package:flutter/material.dart';
import 'package:movie_list_app/generated/l10n.dart';
import 'package:movie_list_app/presentation/bloc/movie/movie_list_bloc.dart';
import 'package:movie_list_app/presentation/bloc/settings/locale_bloc.dart';
import 'package:movie_list_app/presentation/model/enum/movie_list_state.dart';
import 'package:movie_list_app/presentation/screen/movie/selected_movie_screen.dart';
import 'package:movie_list_app/presentation/widget/button/custom_elevated_button.dart';
import 'package:provider/provider.dart';

import 'package:movie_list_app/common/theme/app_colors.dart';
import 'package:movie_list_app/di/di.dart';
import 'package:movie_list_app/domain/movie/entity/movie.dart';

import 'package:movie_list_app/presentation/screen/signal_loss_screen.dart';
import 'package:movie_list_app/presentation/widget/app_bar/custom_app_bar.dart';
import 'package:movie_list_app/presentation/widget/movie/movie_card.dart';

class MovieListScreen extends StatelessWidget {
  static const routeName = '/main';

  const MovieListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<MovieListBloc>(
          create: (_) => getIt<MovieListBloc>(),
          dispose: (_, bloc) => bloc.dispose(),
        ),
        Provider<LocaleBloc>(
          create: (_) => getIt<LocaleBloc>(),
          dispose: (_, bloc) => bloc.dispose(),
        ),
      ],
      child: Consumer<MovieListBloc>(builder: (context, movieListBloc, _) {
        return Consumer<LocaleBloc>(builder: (context, localeBloc, _) {
          return StreamBuilder<bool>(
              stream: movieListBloc.isFavoritedFlagStream,
              builder: (context, snapshot) {
                final bool isFavorited = snapshot.data ?? false;
                return StreamBuilder<MovieListState>(
                    stream: movieListBloc.movieListStateStream,
                    builder: (context, snapshot) {
                      final MovieListState movieListState = snapshot.data ?? MovieListState.popular;

                      return Scaffold(
                        appBar: _buildAppBar(context, movieListBloc, isFavorited, movieListState, localeBloc),
                        body: _buildBody(context, movieListBloc, isFavorited, movieListState),
                      );
                    });
              });
        });
      }),
    );
  }

  PreferredSizeWidget _buildAppBar(
    BuildContext context,
    MovieListBloc movieListBloc,
    bool isFavorited,
    MovieListState movieListState,
    LocaleBloc localeBloc,
  ) {
    final TextStyle? titleStyle = Theme.of(context).textTheme.titleLarge;
    final TextStyle? searchTextStyle = Theme.of(context).textTheme.labelSmall;

    return CustomAppBar(
      leading: _getLeading(movieListState, movieListBloc, isFavorited),
      title: _getTitle(
        context,
        movieListState,
        movieListBloc,
        titleStyle,
        searchTextStyle,
      ),
      actions: [
        Row(
          children: [
            if (movieListState != MovieListState.search) _changeLocaleButton(localeBloc, context),
            const SizedBox(width: 25),
            if (movieListState != MovieListState.search) _searchButton(movieListBloc, isFavorited),
            const SizedBox(width: 25),
          ],
        ),
      ],
    );
  }

  GestureDetector _changeLocaleButton(LocaleBloc localeBloc, BuildContext context) {
    return GestureDetector(
      onTap: () {
        localeBloc.setLocale();
      },
      child: Text(Localizations.localeOf(context).languageCode, style: Theme.of(context).textTheme.labelSmall),
    );
  }

  GestureDetector _searchButton(MovieListBloc movieListBloc, bool isFavorited) {
    return GestureDetector(
      onTap: () {
        movieListBloc.changeMovieListState(MovieListState.search);
        if (isFavorited == false) {
          movieListBloc.addPopularMoviesInSearch();
        }
      },
      child: const Icon(
        Icons.search,
        color: AppColors.colorBlueIcon,
        size: 24,
      ),
    );
  }

  Widget _buildBody(
      BuildContext context, MovieListBloc movieListBloc, bool isFavorited, MovieListState movieListState) {
    Stream<List<MovieEntity>> stream = movieListBloc.popularMoviesStream;
    if (movieListState == MovieListState.favorited) {
      stream = movieListBloc.favoriteMoviesStream;
    } else if (movieListState == MovieListState.search) {
      stream = movieListBloc.searchedMoviesStream;
    }
    return StreamBuilder<List<MovieEntity>>(
        stream: stream,
        builder: (context, snapshot) {
          final List<MovieEntity> movieList = snapshot.data ?? [];

          return Stack(children: [
            CustomScrollView(
              controller: movieListBloc.scrollController,
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              slivers: [
                SliverList(
                  delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
                    return StreamBuilder<List<int>>(
                        stream: movieListBloc.favoriteMoviesIdStream,
                        builder: (context, snapshot) {
                          List<int> favoriteFilmId = snapshot.data ?? [];

                          final bool isMovieFavorited =
                              movieListBloc.isMovieFavorited(movieList[index].filmId, favoriteFilmId: favoriteFilmId);
                          return Column(
                            children: [
                              const SizedBox(height: 6),
                              GestureDetector(
                                  onTap: () => Navigator.pushNamed(
                                        context,
                                        SelectedMovieScreen.routeName,
                                        arguments: [
                                          movieList[index].filmId,
                                          movieList[index].nameRu,
                                          movieList[index].nameEn,
                                          isMovieFavorited,
                                        ],
                                      ),
                                  onLongPress: () async {
                                    isMovieFavorited
                                        ? await movieListBloc.deleteFavoriteMovie(movieList[index])
                                        : await movieListBloc.addFavoriteMovie(movieList[index]);
                                  },
                                  child: MovieCard(
                                    movie: movieList[index],
                                    isMovieFavorited: isMovieFavorited,
                                    poster: movieListBloc.getPoster(movieList[index]),
                                  )),
                            ],
                          );
                        });
                  }, childCount: movieList.length),
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      SizedBox(
                        height: 70 + MediaQuery.of(context).padding.bottom,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            if (movieList.isEmpty && isFavorited == false)
              const Center(
                child: CircularProgressIndicator(),
              ),
            if (movieListBloc.searchedMovieList.isEmpty && movieListState == MovieListState.search)
              Center(
                child: CustomElevatedButton(title: S.of(context).notFound, onPressed: () {}),
              ),
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: _changeSectionButtons(context, movieListBloc, isFavorited),
            ),
          ]);
        });
  }

  Widget? _getLeading(MovieListState movieListState, MovieListBloc movieListBloc, bool isFavorited) {
    if (movieListState == MovieListState.search) {
      return GestureDetector(
        child: const Icon(
          Icons.arrow_back,
          color: AppColors.colorBlueIcon,
        ),
        onTap: () {
          if (isFavorited == true) {
            movieListBloc.changeMovieListState(MovieListState.favorited);
          } else {
            movieListBloc.changeMovieListState(MovieListState.popular);
          }
        },
      );
    }
    return null;
  }

  Widget _getTitle(
    context,
    MovieListState movieListState,
    MovieListBloc movieListBloc,
    TextStyle? titleStyle,
    TextStyle? searchTextStyle,
  ) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: movieListState == MovieListState.popular
          ? Text(
              S.of(context).popular,
              style: titleStyle,
            )
          : (movieListState == MovieListState.favorited
              ? Text(
                  S.of(context).favorites,
                  style: titleStyle,
                )
              : TextField(
                  controller: movieListBloc.searchController,
                  cursorColor: AppColors.searchTextColor,
                  cursorWidth: 3.0,
                  decoration: InputDecoration(
                    hintText: S.of(context).search,
                    hintStyle: searchTextStyle,
                    border: InputBorder.none,
                  ),
                )),
    );
  }
}

Widget _changeSectionButtons(BuildContext context, MovieListBloc movieListBloc, bool isFavorited) {
  return Row(
    children: [
      const Expanded(child: SizedBox()),
      CustomElevatedButton(
        title: S.of(context).popular,
        onPressed: () {
          if (movieListBloc.popularMovieList.isEmpty && isFavorited == false) {
            Navigator.pushNamed(context, SignalLossScreen.routeName);
          } else {
            movieListBloc.changeSection(false);
            movieListBloc.changeMovieListState(MovieListState.popular);
            movieListBloc.scrollController.jumpTo(0.0);
            movieListBloc.reloadPopularMoviesPage();
          }
        },
        buttonColor: AppColors.colorLightButton,
        textColor: AppColors.textColorLightButton,
      ),
      const Expanded(child: SizedBox()),
      CustomElevatedButton(
        title: S.of(context).favorites,
        onPressed: () {
          movieListBloc.changeSection(true);
          movieListBloc.changeMovieListState(MovieListState.favorited);
          movieListBloc.fetchFavoriteMovies();
        },
      ),
      const Expanded(child: SizedBox()),
    ],
  );
}
