import 'package:darabalsadaa/data/models/characters.dart';
import 'package:darabalsadaa/data/services/characterWebSarvices.dart';

class CharacterReposetory {
  final CharacterWebServices characterWebServices;

  CharacterReposetory(this.characterWebServices);
  Future<List<Character>> getAllCharacters() async {
    final characters = await characterWebServices.getAllCharacters();
    return characters
        .map((character) => Character.fromJson(character))
        .toList();
  }
}
