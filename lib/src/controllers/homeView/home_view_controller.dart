import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/src/models/character_model.dart';

abstract class HomeViewController extends ChangeNotifier {
  Future<void> getAll();
  Future<void> getNextPage();
  List<CharacterModel> get characters;
}
