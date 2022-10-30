import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/src/models/character_model.dart';
import 'package:rick_and_morty_app/src/models/get_all_request_model.dart';
import 'package:rick_and_morty_app/src/models/page_info_model.dart';
import 'package:rick_and_morty_app/src/repositories/character_repository.dart';

class HomeViewController extends ChangeNotifier {
  CharacterRepository characterRepository;
  List<CharacterModel> _characters = [];
  late PageInfoModel _pageInfo;

  HomeViewController({required this.characterRepository});

  List<CharacterModel> get characters => _characters;
  PageInfoModel get pageInfo => _pageInfo;

  Future getAll() async {
    GetAllRequestModel result = await characterRepository.getAll();
    _characters = _characters + result.characterList;
    _pageInfo = result.pageInfo;
    notifyListeners();
  }

  Future getNextPage() async {
    GetAllRequestModel result =
        await characterRepository.getNextPage(_pageInfo.next);
    _characters = _characters + result.characterList;
    _pageInfo = result.pageInfo;
    notifyListeners();
  }
}
