import 'package:flutter/material.dart';
import 'package:movie_list_app/common/theme/app_colors.dart';
import 'package:movie_list_app/domain/movie/entity/movie.dart';

class MovieCard extends StatelessWidget {
  final MovieEntity movie;
  final bool isMovieFavorited;
  final ImageProvider poster;
  const MovieCard({
    super.key,
    required this.movie,
    required this.isMovieFavorited,
    required this.poster,
  });

  @override
  Widget build(BuildContext context) {
    final genreAndYearStyle = Theme.of(context).textTheme.bodyLarge;
    final titleStyle = Theme.of(context).textTheme.titleSmall;

    String firstGenre = '';
    if (movie.genres.isNotEmpty) {
      firstGenre = movie.genres[0][0].toUpperCase() + movie.genres[0].substring(1);
    }

    return Container(
      height: 96,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 20,
            offset: const Offset(0, 5),
          ),
        ],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            _moviePoster(),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _movieName(context, titleStyle),
                      const SizedBox(width: 20),
                      isMovieFavorited ? _isFavoriteIcon() : const SizedBox(width: 20)
                    ],
                  ),
                  const SizedBox(height: 5),
                  _genreAndYear(firstGenre, genreAndYearStyle),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Text _genreAndYear(String firstGenre, TextStyle? genreAndYearStyle) {
    return Text(
      '$firstGenre (${movie.year})',
      style: genreAndYearStyle,
    );
  }

  Expanded _movieName(BuildContext context, TextStyle? titleStyle) {
    return Expanded(
      child: Text(
        Localizations.localeOf(context).languageCode == 'ru' ? movie.nameRu : movie.nameEn,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: titleStyle,
      ),
    );
  }

  ClipRRect _moviePoster() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image(
        image: poster,
        fit: BoxFit.cover,
      ),
    );
  }

  Icon _isFavoriteIcon() {
    return const Icon(
      Icons.star_rounded,
      color: AppColors.colorBlueIcon,
      size: 20,
    );
  }
}
