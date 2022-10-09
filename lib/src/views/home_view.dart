import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/src/models/character_model.dart';
import 'package:rick_and_morty_app/src/repository/character_repository.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key, required this.title});

  final String title;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<CharacterModel> characters = [];
  CharacterRepository characterRepository = CharacterRepository();

  void getAllCharacters() async {
    characters = await characterRepository.getAll();
  }

  @override
  void initState() {
    super.initState();
    getAllCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: ListView.builder(
              itemCount: characters.length,
              itemBuilder: ((context, index) {
                var character = characters[index];
                return ListTile(
                  title: Text(character.name),
                );
              })),
        ));
  }
}
