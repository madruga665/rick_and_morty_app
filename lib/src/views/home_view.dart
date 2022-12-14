import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/src/components/character_card.dart';
import 'package:rick_and_morty_app/src/controllers/homeView/home_view_controller.dart';
import 'package:rick_and_morty_app/src/controllers/homeView/home_view_controller_impl.dart';
import 'package:rick_and_morty_app/src/repositories/character/character_repository.dart';
import 'package:rick_and_morty_app/src/repositories/character/character_repository_impl.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key, required this.title});
  final String title;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  CharacterRepository characterRepository = CharacterRepositoryImpl();
  late HomeViewController homeViewController =
      HomeViewControllerImpl(characterRepository: characterRepository);

  void getInitialCharacters() async {
    await homeViewController.getAll();
  }

  void getNextPageCharacters() async {
    await homeViewController.getNextPage();
  }

  @override
  void initState() {
    super.initState();
    getInitialCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: [
            IconButton(
                onPressed: getNextPageCharacters, icon: const Icon(Icons.add))
          ],
        ),
        body: AnimatedBuilder(
          animation: homeViewController,
          builder: (BuildContext context, Widget? child) {
            return Center(
                child: homeViewController.characters.isNotEmpty
                    ? Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 30),
                        child: ListView.builder(
                          itemCount: homeViewController.characters.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: CharacterCard(
                                  character:
                                      homeViewController.characters[index]),
                            );
                          },
                        ))
                    : const CircularProgressIndicator());
          },
        ));
  }
}
