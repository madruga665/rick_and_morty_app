import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/src/Styles/app_colors.dart';
import 'package:rick_and_morty_app/src/models/character_model.dart';

class CharacterDetails extends StatelessWidget {
  const CharacterDetails({super.key, required this.character});
  final CharacterModel character;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.midnight,
        title: Text(character.name),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          color: AppColors.wetAsphalt,
          width: double.infinity,
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
                'Id: ${character.id.toString()}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
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
                height: 5,
              ),
              Text(
                'Status: ${character.status}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                'Specie: ${character.species}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
