import 'package:bloc_omarahmed/data/models/character.dart';
import 'package:bloc_omarahmed/data/api/characters_api.dart';

class CharactersRepo {
  final CharactersApi characterApi;

  CharactersRepo(this.characterApi);

  Future<List<Character>> getAllCharacters() async {
    final jsonCharacters = await characterApi.getAllCharacters();
    final characters = jsonCharacters.map((jc) => Character.fromJson(jc)).toList();

    //Remove female characrters
    characters.removeWhere((c) {
      final name = c.name.toLowerCase();
      return name == 'skyler white' ||
          name == 'marie schrader' ||
          name == 'lydia rodarte-quayle' ||
          name == 'jane margolis' ||
          name == 'skinny pete' ||
          name == 'andrea cantillo' ||
          name == 'carmen molina' ||
          name == 'gretchen schwartz' ||
          name == 'mrs. pinkman' ||
          name == 'wendy s.' ||
          name == 'francesca liddy' ||
          name == 'kaylee ehrmantraut' ||
          name == 'pamela' ||
          name == 'kimberly wexler';
    });

    return characters;
  }
}
