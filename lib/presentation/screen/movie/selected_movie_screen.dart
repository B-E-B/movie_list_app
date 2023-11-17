import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:movie_list_app/common/theme/app_colors.dart';
import 'package:movie_list_app/di/di.dart';
import 'package:movie_list_app/domain/movie/entity/movie.dart';
import 'package:movie_list_app/presentation/bloc/movie/selected_movie_bloc.dart';

class SelectedMovieScreen extends StatelessWidget {
  static const routeName = '/selectedmovie';

  const SelectedMovieScreen({Key? key, List? filmInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final filmInfo = (ModalRoute.of(context)?.settings.arguments);
    final titleStyle = Theme.of(context).textTheme.titleMedium;
    final descriptionStyle = Theme.of(context).textTheme.bodyMedium;
    final genreAndCountries = Theme.of(context).textTheme.bodyLarge;

    return MultiProvider(
      providers: [
        Provider<SelectedMovieBloc>(
          create: (_) => getIt<SelectedMovieBloc>(param1: filmInfo),
          dispose: (_, bloc) => bloc.dispose(),
        )
      ],
      child: Consumer<SelectedMovieBloc>(
        builder: (context, selectedMovieBloc, _) {
          return StreamBuilder<MovieEntity>(
              stream: selectedMovieBloc.selectedMovieStream,
              builder: (context, snapshot) {
                final MovieEntity? movie =
                    snapshot.data?.copyWith(nameRu: selectedMovieBloc.nameRu, nameEn: selectedMovieBloc.nameEn);
                if (movie == null) {
                  return const Scaffold(body: Center(child: CircularProgressIndicator()));
                }
                return Scaffold(
                  body: Stack(
                    children: [
                      CustomScrollView(slivers: [
                        SliverList(
                          delegate: SliverChildListDelegate([
                            Column(
                              children: [
                                _moviePoster(selectedMovieBloc),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      _movieName(context, movie, titleStyle),
                                      const SizedBox(height: 15),
                                      _movieDescription(movie, descriptionStyle),
                                      const SizedBox(height: 15),
                                      _genres(genreAndCountries, movie, descriptionStyle),
                                      const SizedBox(height: 15),
                                      _countries(genreAndCountries, movie, descriptionStyle),
                                      const SizedBox(height: 8),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ]),
                        ),
                      ]),
                      Positioned(
                        left: 16,
                        top: 50,
                        child: _backToListButton(context),
                      )
                    ],
                  ),
                );
              });
        },
      ),
    );
  }

  GestureDetector _backToListButton(BuildContext context) {
    return GestureDetector(
      child: const Icon(
        Icons.arrow_back,
        color: AppColors.colorBlueIcon,
      ),
      onTap: () => Navigator.pop(context),
    );
  }

  Row _countries(TextStyle? genreAndCountries, MovieEntity movie, TextStyle? descriptionStyle) {
    return Row(
      children: [
        Text(
          'Страны: ',
          textAlign: TextAlign.left,
          style: genreAndCountries,
        ),
        Expanded(
          child: Text(
            movie.countries.join(', '),
            textAlign: TextAlign.left,
            style: descriptionStyle,
          ),
        ),
      ],
    );
  }

  Row _genres(TextStyle? genreAndCountries, MovieEntity movie, TextStyle? descriptionStyle) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Жанры: ',
          textAlign: TextAlign.left,
          style: genreAndCountries,
        ),
        Expanded(
          child: Text(
            movie.genres.map((genre) => _capitalizeFirstLetter(genre)).join(', '),
            textAlign: TextAlign.left,
            style: descriptionStyle,
          ),
        ),
      ],
    );
  }

  Text _movieDescription(MovieEntity movie, TextStyle? descriptionStyle) {
    return Text(
      movie.description,
      textAlign: TextAlign.left,
      style: descriptionStyle,
    );
  }

  Text _movieName(context, MovieEntity movie, TextStyle? titleStyle) {
    return Text(
      Localizations.localeOf(context).languageCode == 'ru' ? movie.nameRu : movie.nameEn,
      textAlign: TextAlign.center,
      style: titleStyle,
    );
  }

  SizedBox _moviePoster(SelectedMovieBloc selectedMovieBloc) {
    return SizedBox(
      height: 620,
      child: Image(
        image: selectedMovieBloc.getPoster(),
        fit: BoxFit.cover,
        loadingBuilder: _progressIndicator,
      ),
    );
  }

  Widget _progressIndicator(context, child, loadingProgress) {
    if (loadingProgress == null) {
      return child;
    } else {
      return const Center(child: CircularProgressIndicator());
    }
  }

  String _capitalizeFirstLetter(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1);
  }
}
