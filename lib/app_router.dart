import 'data/api/characters_api.dart';
import 'package:flutter/material.dart';
import 'data/repo/characters_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_omarahmed/data/constants/strings.dart';
import 'package:bloc_omarahmed/business/cubit/characters_cubit.dart';
import 'package:bloc_omarahmed/presentation/screens/characters_screen.dart';

class AppRouter {
  late CharactersRepo charactersRepo;
  late CharactersCubit charactersCubit;
  AppRouter() {
    charactersRepo = CharactersRepo(CharactersApi());
    // characters1cubit = Characters1Cubit(characters1repo);
    charactersCubit = CharactersCubit(charactersRepo);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case charactersScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => CharactersCubit(charactersRepo),
            child: const CharactersScreen(),
          ),
        );
    }
    return null;
  }
}
