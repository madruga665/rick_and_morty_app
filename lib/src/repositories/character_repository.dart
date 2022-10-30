import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:rick_and_morty_app/src/models/character_model.dart';

class CharacterRepository {
  final String _url = 'https://rickandmortyapi.com/api/character/';
  final _dio = Dio();

  Future<List<CharacterModel>> getAll() async {
    try {
      final response = await _dio.get(_url);
      final charactersList = response.data['results'] as List;

      return charactersList.map((map) => CharacterModel.fromMap(map)).toList();
    } on DioError catch (e) {
      log('Error: ${e.error}');
      throw Exception('Erro ao buscar personagem');
    }
  }

  Future<List<CharacterModel>> getNextPage(String nextPageUrl) async {
    try {
      final response = await _dio.get(nextPageUrl);
      final charactersList = response.data['results'] as List;

      return charactersList.map((map) => CharacterModel.fromMap(map)).toList();
    } on DioError catch (e) {
      log('Error: ${e.error}');
      throw Exception('Erro ao buscar personagem');
    }
  }
}
