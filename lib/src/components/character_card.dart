import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/src/styles/app_colors.dart';
import 'package:rick_and_morty_app/src/models/character_model.dart';
import 'package:rick_and_morty_app/src/views/character_details.dart';

class CharacterCard extends StatefulWidget {
  const CharacterCard({super.key, required this.character});
  final CharacterModel character;

  @override
  State<CharacterCard> createState() => _CharacterCardState();
}

class _CharacterCardState extends State<CharacterCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CharacterDetails(
              character: widget.character,
            ),
          ),
        );
      },
      child: Card(
        elevation: 4,
        color: AppColors.emerald,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
                child: Image.network(
                  widget.character.image,
                  width: 100,
                  height: 100,
                ),
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(children: [
                  Text(
                    widget.character.name,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  )
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
