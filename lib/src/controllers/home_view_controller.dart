import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/src/models/character_model.dart';
import 'package:rick_and_morty_app/src/repositories/character_repository.dart';

class HomeViewController extends ChangeNotifier {
  CharacterRepository characterRepository;
  List<CharacterModel> _characters = [];

  HomeViewController({required this.characterRepository});

  List<CharacterModel> get characters => _characters;

  Future getAll() async {
    var allCharacters = await characterRepository.getAll();
    _characters = _characters + allCharacters;
    notifyListeners();
  }
}
