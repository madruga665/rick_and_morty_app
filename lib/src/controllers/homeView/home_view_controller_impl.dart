import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/src/controllers/homeView/home_view_controller.dart';
import 'package:rick_and_morty_app/src/models/character_model.dart';
import 'package:rick_and_morty_app/src/models/get_all_request_model.dart';
import 'package:rick_and_morty_app/src/models/page_info_model.dart';
import 'package:rick_and_morty_app/src/repositories/character/character_repository.dart';

class HomeViewControllerImpl extends ChangeNotifier
    implements HomeViewController {
  final CharacterRepository characterRepository;
  final List<CharacterModel> _characters = [];
  late PageInfoModel _pageInfo;

  HomeViewControllerImpl({required this.characterRepository});

  @override
  List<CharacterModel> get characters => _characters;

  @override
  Future<void> getAll() async {
    GetAllRequestModel result = await characterRepository.getAll();
    _characters.addAll(result.characterList);
    _pageInfo = result.pageInfo;
    notifyListeners();
  }

  @override
  Future<void> getNextPage() async {
    GetAllRequestModel result =
        await characterRepository.getAll(_pageInfo.next);
    _characters.addAll(result.characterList);
    _pageInfo = result.pageInfo;
    notifyListeners();
  }
}
