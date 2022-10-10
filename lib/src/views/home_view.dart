import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/src/components/character_card.dart';
import 'package:rick_and_morty_app/src/repositories/character_repository.dart';

import '../models/character_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key, required this.title});
  final String title;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late Future<List<CharacterModel>> characters;
  final CharacterRepository characterRepository = CharacterRepository();

  @override
  void initState() {
    super.initState();
    characters = characterRepository.getAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
            child: FutureBuilder<List<CharacterModel>>(
          future: characters,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
                  child: ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: CharacterCard(
                            character: snapshot.data!.elementAt(index)),
                      );
                    },
                  ));
            } else if (snapshot.hasError) {
              return ElevatedButton(
                  onPressed: () => setState(() {
                        characters = characterRepository.getAll();
                      }),
                  child: const Text('TENTAR NOVAMENTE'));
            }
            return const CircularProgressIndicator();
          },
        )));
  }
}
