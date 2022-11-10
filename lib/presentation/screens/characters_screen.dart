import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_omarahmed/data/constants/colors.dart';
import 'package:bloc_omarahmed/business/cubit/characters_cubit.dart';
import 'package:bloc_omarahmed/presentation/widgets/character_item.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({super.key});

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  late final CharactersCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = BlocProvider.of<CharactersCubit>(context);
    cubit.getAllCharacters();
  }

  Widget buildCharactersList() {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      children: cubit.displayedCharcters.map((c) => CharacterCard(character: c)).toList(),
    );
  }

  

  Widget showLoadingIndicator() {
    return Center(
      child: CircularProgressIndicator(color: MyColors.yellow),
    );
  }

  Widget _buildAppBar() {
    return Text('Characters', style: TextStyle(color: MyColors.grey));
  }

  Widget _buildSearchFeild() {
    return TextField(
      autofocus: true,
      cursorColor: MyColors.grey,
      controller: cubit.searchTextController,
      onChanged: (query) => cubit.charactersSearch(query),
      style: TextStyle(color: MyColors.grey, fontSize: 18),
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: 'Find a Character..',
        hintStyle: TextStyle(color: MyColors.grey, fontSize: 18),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharactersCubit, CharactersState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: MyColors.grey,
          appBar: AppBar(
            iconTheme: IconThemeData(color: MyColors.grey),
            backgroundColor: MyColors.yellow,
            title: cubit.isSearching ? _buildSearchFeild() : _buildAppBar(),
            actions: [
              if (cubit.isSearching) ...[
                IconButton(
                  onPressed: () => cubit.stopSearch(),
                  icon: Icon(Icons.clear, color: MyColors.grey),
                ),
              ] else ...[
                IconButton(
                  onPressed: () => cubit.startSearch(context),
                  icon: Icon(Icons.search, color: MyColors.grey),
                )
              ],
            ],
          ),
          body: state is CharactersLoaded ? buildCharactersList() : showLoadingIndicator(),
        );
      },
    );
  }
}
