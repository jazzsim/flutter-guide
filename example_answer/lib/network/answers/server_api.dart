import 'package:example_answer/base_client.dart';
import 'package:example_answer/network/answers/data/model/get_all_characters_model.dart';

class ServerApi {
  Future<List<CharacterModel>> getAllCharacter() async {
    final res = await BaseClient().get('characters');
    if (res != null) {
      return List.from(res).map((e) => CharacterModel.fromJson(e)).toList();
    }
    throw Exception();
  }
}
