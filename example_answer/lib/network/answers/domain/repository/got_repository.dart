import 'package:example_answer/network/answers/domain/entity/character.dart';

abstract class GotRepository {
  Future<List<Character>> getAllCharacters();

  Future<Character> getCharacterInfo();

  Future<bool> updateCharacterInfo();
}