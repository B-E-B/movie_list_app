// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_db.dart';

// ignore_for_file: type=lint
class $MoviesTable extends Movies with TableInfo<$MoviesTable, Movie> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MoviesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _filmIdMeta = const VerificationMeta('filmId');
  @override
  late final GeneratedColumn<int> filmId = GeneratedColumn<int>(
      'film_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _nameRuMeta = const VerificationMeta('nameRu');
  @override
  late final GeneratedColumn<String> nameRu = GeneratedColumn<String>(
      'name_ru', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameEnMeta = const VerificationMeta('nameEn');
  @override
  late final GeneratedColumn<String> nameEn = GeneratedColumn<String>(
      'name_en', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _yearMeta = const VerificationMeta('year');
  @override
  late final GeneratedColumn<String> year = GeneratedColumn<String>(
      'year', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _countriesMeta =
      const VerificationMeta('countries');
  @override
  late final GeneratedColumn<String> countries = GeneratedColumn<String>(
      'countries', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _genresMeta = const VerificationMeta('genres');
  @override
  late final GeneratedColumn<String> genres = GeneratedColumn<String>(
      'genres', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _posterUrlMeta =
      const VerificationMeta('posterUrl');
  @override
  late final GeneratedColumn<String> posterUrl = GeneratedColumn<String>(
      'poster_url', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _posterUrlPreviewMeta =
      const VerificationMeta('posterUrlPreview');
  @override
  late final GeneratedColumn<String> posterUrlPreview = GeneratedColumn<String>(
      'poster_url_preview', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        filmId,
        nameRu,
        nameEn,
        year,
        countries,
        genres,
        posterUrl,
        posterUrlPreview,
        description
      ];
  @override
  String get aliasedName => _alias ?? 'movies';
  @override
  String get actualTableName => 'movies';
  @override
  VerificationContext validateIntegrity(Insertable<Movie> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('film_id')) {
      context.handle(_filmIdMeta,
          filmId.isAcceptableOrUnknown(data['film_id']!, _filmIdMeta));
    }
    if (data.containsKey('name_ru')) {
      context.handle(_nameRuMeta,
          nameRu.isAcceptableOrUnknown(data['name_ru']!, _nameRuMeta));
    } else if (isInserting) {
      context.missing(_nameRuMeta);
    }
    if (data.containsKey('name_en')) {
      context.handle(_nameEnMeta,
          nameEn.isAcceptableOrUnknown(data['name_en']!, _nameEnMeta));
    } else if (isInserting) {
      context.missing(_nameEnMeta);
    }
    if (data.containsKey('year')) {
      context.handle(
          _yearMeta, year.isAcceptableOrUnknown(data['year']!, _yearMeta));
    } else if (isInserting) {
      context.missing(_yearMeta);
    }
    if (data.containsKey('countries')) {
      context.handle(_countriesMeta,
          countries.isAcceptableOrUnknown(data['countries']!, _countriesMeta));
    } else if (isInserting) {
      context.missing(_countriesMeta);
    }
    if (data.containsKey('genres')) {
      context.handle(_genresMeta,
          genres.isAcceptableOrUnknown(data['genres']!, _genresMeta));
    } else if (isInserting) {
      context.missing(_genresMeta);
    }
    if (data.containsKey('poster_url')) {
      context.handle(_posterUrlMeta,
          posterUrl.isAcceptableOrUnknown(data['poster_url']!, _posterUrlMeta));
    } else if (isInserting) {
      context.missing(_posterUrlMeta);
    }
    if (data.containsKey('poster_url_preview')) {
      context.handle(
          _posterUrlPreviewMeta,
          posterUrlPreview.isAcceptableOrUnknown(
              data['poster_url_preview']!, _posterUrlPreviewMeta));
    } else if (isInserting) {
      context.missing(_posterUrlPreviewMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {filmId};
  @override
  Movie map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Movie(
      filmId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}film_id'])!,
      nameRu: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name_ru'])!,
      nameEn: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name_en'])!,
      year: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}year'])!,
      countries: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}countries'])!,
      genres: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}genres'])!,
      posterUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}poster_url'])!,
      posterUrlPreview: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}poster_url_preview'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
    );
  }

  @override
  $MoviesTable createAlias(String alias) {
    return $MoviesTable(attachedDatabase, alias);
  }
}

class Movie extends DataClass implements Insertable<Movie> {
  final int filmId;
  final String nameRu;
  final String nameEn;
  final String year;
  final String countries;
  final String genres;
  final String posterUrl;
  final String posterUrlPreview;
  final String description;
  const Movie(
      {required this.filmId,
      required this.nameRu,
      required this.nameEn,
      required this.year,
      required this.countries,
      required this.genres,
      required this.posterUrl,
      required this.posterUrlPreview,
      required this.description});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['film_id'] = Variable<int>(filmId);
    map['name_ru'] = Variable<String>(nameRu);
    map['name_en'] = Variable<String>(nameEn);
    map['year'] = Variable<String>(year);
    map['countries'] = Variable<String>(countries);
    map['genres'] = Variable<String>(genres);
    map['poster_url'] = Variable<String>(posterUrl);
    map['poster_url_preview'] = Variable<String>(posterUrlPreview);
    map['description'] = Variable<String>(description);
    return map;
  }

  MoviesCompanion toCompanion(bool nullToAbsent) {
    return MoviesCompanion(
      filmId: Value(filmId),
      nameRu: Value(nameRu),
      nameEn: Value(nameEn),
      year: Value(year),
      countries: Value(countries),
      genres: Value(genres),
      posterUrl: Value(posterUrl),
      posterUrlPreview: Value(posterUrlPreview),
      description: Value(description),
    );
  }

  factory Movie.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Movie(
      filmId: serializer.fromJson<int>(json['filmId']),
      nameRu: serializer.fromJson<String>(json['nameRu']),
      nameEn: serializer.fromJson<String>(json['nameEn']),
      year: serializer.fromJson<String>(json['year']),
      countries: serializer.fromJson<String>(json['countries']),
      genres: serializer.fromJson<String>(json['genres']),
      posterUrl: serializer.fromJson<String>(json['posterUrl']),
      posterUrlPreview: serializer.fromJson<String>(json['posterUrlPreview']),
      description: serializer.fromJson<String>(json['description']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'filmId': serializer.toJson<int>(filmId),
      'nameRu': serializer.toJson<String>(nameRu),
      'nameEn': serializer.toJson<String>(nameEn),
      'year': serializer.toJson<String>(year),
      'countries': serializer.toJson<String>(countries),
      'genres': serializer.toJson<String>(genres),
      'posterUrl': serializer.toJson<String>(posterUrl),
      'posterUrlPreview': serializer.toJson<String>(posterUrlPreview),
      'description': serializer.toJson<String>(description),
    };
  }

  Movie copyWith(
          {int? filmId,
          String? nameRu,
          String? nameEn,
          String? year,
          String? countries,
          String? genres,
          String? posterUrl,
          String? posterUrlPreview,
          String? description}) =>
      Movie(
        filmId: filmId ?? this.filmId,
        nameRu: nameRu ?? this.nameRu,
        nameEn: nameEn ?? this.nameEn,
        year: year ?? this.year,
        countries: countries ?? this.countries,
        genres: genres ?? this.genres,
        posterUrl: posterUrl ?? this.posterUrl,
        posterUrlPreview: posterUrlPreview ?? this.posterUrlPreview,
        description: description ?? this.description,
      );
  @override
  String toString() {
    return (StringBuffer('Movie(')
          ..write('filmId: $filmId, ')
          ..write('nameRu: $nameRu, ')
          ..write('nameEn: $nameEn, ')
          ..write('year: $year, ')
          ..write('countries: $countries, ')
          ..write('genres: $genres, ')
          ..write('posterUrl: $posterUrl, ')
          ..write('posterUrlPreview: $posterUrlPreview, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(filmId, nameRu, nameEn, year, countries,
      genres, posterUrl, posterUrlPreview, description);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Movie &&
          other.filmId == this.filmId &&
          other.nameRu == this.nameRu &&
          other.nameEn == this.nameEn &&
          other.year == this.year &&
          other.countries == this.countries &&
          other.genres == this.genres &&
          other.posterUrl == this.posterUrl &&
          other.posterUrlPreview == this.posterUrlPreview &&
          other.description == this.description);
}

class MoviesCompanion extends UpdateCompanion<Movie> {
  final Value<int> filmId;
  final Value<String> nameRu;
  final Value<String> nameEn;
  final Value<String> year;
  final Value<String> countries;
  final Value<String> genres;
  final Value<String> posterUrl;
  final Value<String> posterUrlPreview;
  final Value<String> description;
  const MoviesCompanion({
    this.filmId = const Value.absent(),
    this.nameRu = const Value.absent(),
    this.nameEn = const Value.absent(),
    this.year = const Value.absent(),
    this.countries = const Value.absent(),
    this.genres = const Value.absent(),
    this.posterUrl = const Value.absent(),
    this.posterUrlPreview = const Value.absent(),
    this.description = const Value.absent(),
  });
  MoviesCompanion.insert({
    this.filmId = const Value.absent(),
    required String nameRu,
    required String nameEn,
    required String year,
    required String countries,
    required String genres,
    required String posterUrl,
    required String posterUrlPreview,
    required String description,
  })  : nameRu = Value(nameRu),
        nameEn = Value(nameEn),
        year = Value(year),
        countries = Value(countries),
        genres = Value(genres),
        posterUrl = Value(posterUrl),
        posterUrlPreview = Value(posterUrlPreview),
        description = Value(description);
  static Insertable<Movie> custom({
    Expression<int>? filmId,
    Expression<String>? nameRu,
    Expression<String>? nameEn,
    Expression<String>? year,
    Expression<String>? countries,
    Expression<String>? genres,
    Expression<String>? posterUrl,
    Expression<String>? posterUrlPreview,
    Expression<String>? description,
  }) {
    return RawValuesInsertable({
      if (filmId != null) 'film_id': filmId,
      if (nameRu != null) 'name_ru': nameRu,
      if (nameEn != null) 'name_en': nameEn,
      if (year != null) 'year': year,
      if (countries != null) 'countries': countries,
      if (genres != null) 'genres': genres,
      if (posterUrl != null) 'poster_url': posterUrl,
      if (posterUrlPreview != null) 'poster_url_preview': posterUrlPreview,
      if (description != null) 'description': description,
    });
  }

  MoviesCompanion copyWith(
      {Value<int>? filmId,
      Value<String>? nameRu,
      Value<String>? nameEn,
      Value<String>? year,
      Value<String>? countries,
      Value<String>? genres,
      Value<String>? posterUrl,
      Value<String>? posterUrlPreview,
      Value<String>? description}) {
    return MoviesCompanion(
      filmId: filmId ?? this.filmId,
      nameRu: nameRu ?? this.nameRu,
      nameEn: nameEn ?? this.nameEn,
      year: year ?? this.year,
      countries: countries ?? this.countries,
      genres: genres ?? this.genres,
      posterUrl: posterUrl ?? this.posterUrl,
      posterUrlPreview: posterUrlPreview ?? this.posterUrlPreview,
      description: description ?? this.description,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (filmId.present) {
      map['film_id'] = Variable<int>(filmId.value);
    }
    if (nameRu.present) {
      map['name_ru'] = Variable<String>(nameRu.value);
    }
    if (nameEn.present) {
      map['name_en'] = Variable<String>(nameEn.value);
    }
    if (year.present) {
      map['year'] = Variable<String>(year.value);
    }
    if (countries.present) {
      map['countries'] = Variable<String>(countries.value);
    }
    if (genres.present) {
      map['genres'] = Variable<String>(genres.value);
    }
    if (posterUrl.present) {
      map['poster_url'] = Variable<String>(posterUrl.value);
    }
    if (posterUrlPreview.present) {
      map['poster_url_preview'] = Variable<String>(posterUrlPreview.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MoviesCompanion(')
          ..write('filmId: $filmId, ')
          ..write('nameRu: $nameRu, ')
          ..write('nameEn: $nameEn, ')
          ..write('year: $year, ')
          ..write('countries: $countries, ')
          ..write('genres: $genres, ')
          ..write('posterUrl: $posterUrl, ')
          ..write('posterUrlPreview: $posterUrlPreview, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $MoviesTable movies = $MoviesTable(this);
  late final MovieDao movieDao = MovieDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [movies];
}
