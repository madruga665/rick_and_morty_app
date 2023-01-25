import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:rick_and_morty_app/src/models/character_model.dart';
import 'package:rick_and_morty_app/src/models/get_all_request_model.dart';
import 'package:rick_and_morty_app/src/models/page_info_model.dart';
import 'package:rick_and_morty_app/src/repositories/character/character_repository.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  static const _url = 'https://rickandmortyapi.com/api/character/';
  final _dio = Dio();

  @override
  Future<GetAllRequestModel> getAll([String? characterUrl = _url]) async {
    try {
      final response = await _dio.get(characterUrl!);
      final charactersList = response.data['results'] as List;
      final pageInfo = response.data['info'];
      final charactersListResult =
          charactersList.map((map) => CharacterModel.fromMap(map)).toList();
      final pageInfoResult = PageInfoModel.fromMap(pageInfo);

      return GetAllRequestModel(charactersListResult, pageInfoResult);
    } on DioError catch (e) {
      log('Error: ${e.error}');
      throw Exception('Erro ao buscar personagem');
    }
  }
}
