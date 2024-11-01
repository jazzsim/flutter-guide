import 'package:example_answer/network/answers/domain/entity/character.dart';
import 'package:example_answer/network/answers/domain/repository/got_repository.dart';
import 'package:example_answer/network/answers/server_api.dart';

class GotRepositoryImpl extends GotRepository {
  @override
  Future<List<Character>> getAllCharacters() async {
    List<Character> res = [];

    final data = await ServerApi().getAllCharacter();
    for (var element in data) {
      res.add(Character(
        fullName: element.fullName ?? "",
        title: element.title ?? "",
        family: element.family ?? "",
        imageUrl: element.imageUrl ?? "",
      ));
    }

    return res;
  }

  @override
  Future<Character> getCharacterInfo() async {
    // TODO: implement getCharacterInfo
    throw UnimplementedError();
  }

  @override
  Future<bool> updateCharacterInfo() async {
    // TODO: implement updateCharacterInfo
    throw UnimplementedError();
  }
}
