import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/src/models/character_model.dart';

class CharacterDetails extends StatelessWidget {
  const CharacterDetails({super.key, required this.character});
  final CharacterModel character;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(character.name),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(15),
                ),
                child: Image.network(
                  character.image,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Name: ${character.name}',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Id: ${character.id.toString()}',
                style: const TextStyle(
                  fontSize: 20,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
