import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/src/styles/app_colors.dart';
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
  final ScrollController _scrollController = ScrollController();

  void infiniteScrolling() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      homeViewController.getNextPage();
    }
  }

  @override
  void initState() {
    super.initState();
    homeViewController.getAll();
    _scrollController.addListener(infiniteScrolling);
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
    homeViewController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.midnight,
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Container(
        color: AppColors.wetAsphalt,
        child: AnimatedBuilder(
          animation: homeViewController,
          builder: (BuildContext context, Widget? child) {
            return Center(
              child: homeViewController.characters.isNotEmpty
                  ? Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: ListView.builder(
                        controller: _scrollController,
                        itemCount: homeViewController.characters.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 10),
                            child: CharacterCard(
                              character: homeViewController.characters[index],
                            ),
                          );
                        },
                      ),
                    )
                  : const CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
