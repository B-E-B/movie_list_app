import 'package:flutter/material.dart';
import 'package:movie_list_app/presentation/screen/auth/authorization_screen.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = '/splash';

  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2)).then((value) {
      Navigator.pushReplacementNamed(context, AuthorizationScreen.routeName);
    });
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 110, 190, 255),
      body: SizedBox.expand(
        child: Stack(
          alignment: Alignment.centerRight,
          children: [
            Padding(
              padding: EdgeInsets.only(right: 25),
              child: Text(
                'MOVIE\nLIST\nAPP',
                //style: AppTheme.defaults().textTheme.titleLarge,
                textAlign: TextAlign.end,
                style: TextStyle(fontSize: 72, fontWeight: FontWeight.w900, color: Colors.yellow, shadows: [
                  Shadow(
                    color: Colors.black,
                    offset: Offset(5.0, 5.0),
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
