import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_omarahmed/data/models/character.dart';
import 'package:bloc_omarahmed/data/repo/characters_repo.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharactersRepo charactersRepo;

  List<Character> characters = [];

  List<Character> displayedCharcters = [];

  final searchTextController = TextEditingController();

  bool isSearching = false;

  void startSearch(BuildContext context) {
    isSearching = true;
    emit(CharactersLoaded());
  }

  void stopSearch() {
    isSearching = false;
    searchTextController.clear();
    displayedCharcters = characters;
    emit(CharactersLoaded());
  }

  CharactersCubit(this.charactersRepo) : super(CharactersInitial());

  Future<List<Character>> getAllCharacters() async {
    characters = await charactersRepo.getAllCharacters();
    displayedCharcters = characters;
    emit(CharactersLoaded());

    return characters;
  }

  void charactersSearch(String query) {
    if (searchTextController.text.trim().isNotEmpty) {
      displayedCharcters = characters.where((char) => char.name.toLowerCase().contains(query.toLowerCase())).toList();
    } else {
      displayedCharcters = characters;
    }
    emit(CharactersLoaded());
  }
}
