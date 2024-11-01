import 'package:example_answer/network/answers/data/repository/got_repository_impl.dart';
import 'package:example_answer/network/answers/domain/entity/character.dart';
import 'package:example_answer/network/answers/domain/repository/got_repository.dart';

class Ans1Controller {
  final GotRepository gotRepository;

  Ans1Controller() : gotRepository = GotRepositoryImpl();

  Future<List<Character>> getAllCharacters() async {
    return await gotRepository.getAllCharacters();
  }
}
