import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:movie_list_app/common/theme/app_theme.dart';
import 'package:movie_list_app/data/database/app_db.dart';
import 'package:movie_list_app/di/di.dart';
import 'package:movie_list_app/firebase_options.dart';
import 'package:movie_list_app/presentation/bloc/settings/locale_bloc.dart';
import 'package:movie_list_app/presentation/screen/auth/authorization_screen.dart';
import 'package:movie_list_app/presentation/screen/auth/signup_screen.dart';
import 'package:movie_list_app/presentation/screen/movie/movie_list_screen.dart';
import 'package:movie_list_app/presentation/screen/movie/selected_movie_screen.dart';
import 'package:movie_list_app/presentation/screen/signal_loss_screen.dart';
import 'package:movie_list_app/presentation/screen/splash_screen.dart';
import 'package:provider/provider.dart';
import 'generated/l10n.dart';




void main() async {
  getIt.registerSingleton<AppDatabase>(AppDatabase(), signalsReady: true);

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await configureDependencies(Environment.dev);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<LocaleBloc>(
            create: (_) => getIt<LocaleBloc>(),
            dispose: (_, bloc) => bloc.dispose(),
          ),
        ],
        child: Consumer<LocaleBloc>(builder: (context, localeBloc, _) {
          return StreamBuilder<Locale>(
              stream: localeBloc.localeStream,
              builder: (context, snapshot) {
                final Locale locale = snapshot.data ?? const Locale('en');
                return MaterialApp(
                  locale: locale,
                  title: 'Список фильмов',
                  debugShowCheckedModeBanner: false,
                  theme: AppTheme.defaults(),
                  localizationsDelegates: const [
                    S.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  supportedLocales: S.delegate.supportedLocales,
                  initialRoute: SplashScreen.routeName,
                  routes: {
                    MovieListScreen.routeName: (context) => const MovieListScreen(),
                    SelectedMovieScreen.routeName: (context) => const SelectedMovieScreen(),
                    SignalLossScreen.routeName: (context) => const SignalLossScreen(),
                    SplashScreen.routeName: (context) => const SplashScreen(),
                    AuthorizationScreen.routeName: (context) => const AuthorizationScreen(),
                    SignUpScreen.routeName: (context) => const SignUpScreen(),
                  },
                );
              });
        }));
  }
}
