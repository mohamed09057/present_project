import 'package:bloc/bloc.dart';
import 'package:darabalsadaa/data/models/characters.dart';
import 'package:darabalsadaa/data/reposetories/character_reposetory.dart';
import 'package:meta/meta.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharacterReposetory characterReposetory;
  List<Character> characters;

  CharactersCubit(this.characterReposetory) : super(CharactersInitial());

  List<Character> getAllCharacters() {
    characterReposetory.getAllCharacters().then((characters) {
      emit(CharacterLoaded(characters));
      this.characters = characters;
    });
    return characters;
  }
}
