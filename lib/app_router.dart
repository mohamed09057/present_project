import 'package:darabalsadaa/buseness_logic/cubit/characters_cubit.dart';
import 'package:darabalsadaa/data/reposetories/character_reposetory.dart';
import 'package:darabalsadaa/data/services/characterWebSarvices.dart';
import 'package:darabalsadaa/presentation/screens/character_screen.dart';
import 'package:darabalsadaa/presentation/screens/characters_details.dart';
import 'package:darabalsadaa/presentation/screens/getting_started_screen.dart';
import 'package:darabalsadaa/presentation/screens/login_screen.dart';
import 'package:darabalsadaa/presentation/screens/signup_screen.dart';
import 'package:darabalsadaa/presentation/screens/start_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'conistants/strings.dart';

class AppRouter {
  CharacterReposetory characterReposetory;
  CharactersCubit charactersCubit;

  AppRouter() {
    characterReposetory = CharacterReposetory(CharacterWebServices());
    charactersCubit = CharactersCubit(characterReposetory);
  }

  Route generateRouter(RouteSettings settings) {
    switch (settings.name) {
      case gettingStartedScreen:
        return MaterialPageRoute(
          builder: (_) => GettingStartedScreen(),
        );
      case startScreen:
        return MaterialPageRoute(
          builder: (_) => StartScreen(),
        );
      case loginScreen:
        return MaterialPageRoute(
          builder: (_) => LoginScreen(),
        );
      case signupScreen:
        return MaterialPageRoute(
          builder: (_) => SignupScreen(),
        );

      case charactersScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) {
              return charactersCubit;
            },
            child: CharacterScreen(),
          ),
        );
      case charactersDetailsScreen:
        return MaterialPageRoute(
          builder: (_) => CharacterDetailsScreen(),
        );
    }
    return null;
  }
}
