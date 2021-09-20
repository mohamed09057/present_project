import 'package:darabalsadaa/conistants/my_colors.dart';
import 'package:darabalsadaa/data/models/characters.dart';
import 'package:flutter/material.dart';

class CharacterItems extends StatelessWidget {
  final Character character;

  const CharacterItems({Key key, @required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: MyColors.myWhite,
        borderRadius: BorderRadius.circular(8),
      ),
      child: GridTile(
        child: Container(
          color: MyColors.myGray,
          child: character.image.isNotEmpty
              ? FadeInImage.assetNetwork(
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                  placeholder: 'assets/images/logo.png',
                  image: character.image)
              : Image.asset('assets/images/logo.png'),
        ),
        footer: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          alignment: Alignment.bottomCenter,
          color: Colors.black54,
          child: Text(
            '${character.name}',
            style: TextStyle(
              height: 1.3,
              fontSize: 17,
              color: MyColors.myWhite,
              fontWeight: FontWeight.bold,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
