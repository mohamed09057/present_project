import 'package:darabalsadaa/buseness_logic/cubit/characters_cubit.dart';
import 'package:darabalsadaa/conistants/my_colors.dart';
import 'package:darabalsadaa/data/models/characters.dart';
import 'package:darabalsadaa/presentation/widgets/character_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharacterScreen extends StatefulWidget {
  @override
  _CharacterScreenState createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  List<Character> allCharacters;

  @override
  void initState() {
    super.initState();
    allCharacters =
        BlocProvider.of<CharactersCubit>(context).getAllCharacters();
  }

  Widget buildBlocBuilder() {
    return BlocBuilder<CharactersCubit, CharactersState>(
      builder: (context, state) {
        if (state is CharacterLoaded) {
          allCharacters = (state).characters;
          return buildLoadedListWidget();
        } else {
          return loadingIndecator();
        }
      },
    );
  }

  Widget loadingIndecator() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget  buildLoadedListWidget() {
    return SingleChildScrollView(
      child: Container(
        color: MyColors.myGray,
        child: Column(
          children: [
            buildCharactersList(),
          ],
        ),
      ),
    );
  }

  Widget buildCharactersList() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 3,
          crossAxisSpacing: 1,
          mainAxisSpacing: 1),
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: ClampingScrollPhysics(),
      itemCount: allCharacters.length,
      itemBuilder: (context, index) {
        return CharacterItems(character: allCharacters[index]);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Characters",
          style: TextStyle(color: MyColors.myGray),
        ),
        centerTitle: true,
        backgroundColor: MyColors.myGreen
      ),
      body: buildBlocBuilder(),
    );
  }
}
