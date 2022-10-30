import 'package:rick_and_morty_app/src/models/character_model.dart';

abstract class CharacterRepository {
  Future<List<CharacterModel>> getAll();
  Future<List<CharacterModel>> getNextPage(String nextPageUrl);
}
