import 'package:flutter/material.dart';

import '../models/character.dart';

import '../styleguide.dart';

class CharacterDetailScreen extends StatelessWidget {
  final Character character;

  const CharacterDetailScreen({Key key, this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          ///

          Hero(
            tag: "background-${characters[0].name}",
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: character.colors,
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                ),
              ),
            ),
          ),

          ///

          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ///

                SizedBox(height: 40),

                ///

                Padding(
                  padding: const EdgeInsets.only(top: 8.0, left: 16),
                  child: IconButton(
                    iconSize: 40,
                    icon: Icon(Icons.close),
                    color: Colors.white.withOpacity(0.9),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),

                ///

                Align(
                  alignment: Alignment.topRight,
                  child: Hero(
                    tag: "image-{$characters[0].name}",
                    child: Image.asset(
                      character.imagePath,
                      height: screenHeight * 0.45,
                    ),
                  ),
                ),

                ///

                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32.0, vertical: 8),
                  child: Hero(
                    tag: "name-${characters[0].name}",
                    child: Material(
                      color: Colors.transparent,
                      child: Container(
                        child: Text(
                          character.name,
                          style: AppTheme.heading,
                        ),
                      ),
                    ),
                  ),
                ),

                ///

                Padding(
                  padding: const EdgeInsets.fromLTRB(32, 0, 8, 32),
                  child: Text(
                    character.description,
                    style: AppTheme.subHeading,
                  ),
                ),

                ///
              ],
            ),
          ),

          ///
        ],
      ),
    );
  }
}
