import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/src/models/character_model.dart';

class CharacterDetails extends StatelessWidget {
  const CharacterDetails({super.key, required this.character});
  final CharacterModel character;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan[800],
        title: Text(character.name),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.cyan,
                (Colors.teal[900])!,
              ],
            ),
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(15),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 6,
                    ),
                  ),
                  child: Image.network(
                    character.image,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Name: ${character.name}',
                style: const TextStyle(
                  color: Colors.white,
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
                  color: Colors.white,
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
