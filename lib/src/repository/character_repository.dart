import 'package:dio/dio.dart';
import 'package:rick_and_morty_app/src/models/character_model.dart';

class CharacterRepository {
  final String _url = 'https://rickandmortyapi.com/api/character/';
  final _dio = Dio();

  Future<List<CharacterModel>> getAll() async {
    final response = await _dio.get(_url);
    final charactersList = response.data['results'] as List;

    return charactersList.map((json) => CharacterModel.fromJson(json)).toList();
  }
}
