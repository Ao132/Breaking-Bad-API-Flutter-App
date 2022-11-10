import 'package:bloc_omarahmed/data/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:bloc_omarahmed/data/models/character.dart';
import 'package:bloc_omarahmed/data/constants/colors.dart';

class CharacterCard extends StatelessWidget {
  final Character character;

  const CharacterCard({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: const EdgeInsetsDirectional.all(4),
      decoration: BoxDecoration(
        color: MyColors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: GridTile(
        footer: Container(
          color: Colors.black54,
          alignment: Alignment.bottomCenter, 
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Text(
            character.name,
            style: TextStyle(height: 1.3, color: MyColors.white, fontSize: 16, fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
        ),
        child: Container(
          color: MyColors.grey,
          child: character.image.isNotEmpty
              ? FadeInImage.assetNetwork(
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                  placeholder: 'assets/images/loading.gif',
                  image: character.image)
              : Image.asset('assets/images/not found.gif'),
        ),
      ),
    );
  }
}
