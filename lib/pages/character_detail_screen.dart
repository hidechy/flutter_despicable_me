import 'package:flutter/material.dart';

import 'package:after_layout/after_layout.dart';

import '../models/character.dart';
import '../styleguide.dart';

class CharacterDetailScreen extends StatefulWidget {
  final Character character;

  const CharacterDetailScreen({Key key, this.character}) : super(key: key);

  @override
  _CharacterDetailScreenState createState() => _CharacterDetailScreenState();
}

class _CharacterDetailScreenState extends State<CharacterDetailScreen>
    with AfterLayoutMixin<CharacterDetailScreen> {
  double bottomSheetButtonHeight;
  double bottomSheetBodyHeight;
  double bottomSheetBottomPosition;

  bool isCollapsed = false;

  Size size;

  ///
  @override
  void initState() {
    super.initState();
    bottomSheetButtonHeight = 80.0;
    bottomSheetBodyHeight = 500.0;

    bottomSheetBottomPosition =
        (bottomSheetButtonHeight + bottomSheetBodyHeight) * -1.0;
  }

  ///
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    final screenHeight = size.height;

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          ///

          Hero(
            tag: "background-${widget.character.name}",
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: widget.character.colors,
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
                SizedBox(height: 40),
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
                Align(
                  alignment: Alignment.topRight,
                  child: Hero(
                      tag: "image-${widget.character.name}",
                      child: Image.asset(widget.character.imagePath,
                          height: screenHeight * 0.45)),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32.0, vertical: 8),
                  child: Hero(
                      tag: "name-${widget.character.name}",
                      child: Material(
                          color: Colors.transparent,
                          child: Container(
                              child: Text(widget.character.name,
                                  style: AppTheme.heading)))),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(32, 0, 8, 32),
                  child: Text(widget.character.description,
                      style: AppTheme.subHeading),
                ),
              ],
            ),
          ),

          ///

          //-----s

          AnimatedPositioned(
            duration: const Duration(milliseconds: 500),
            curve: Curves.decelerate,
            bottom: bottomSheetBottomPosition,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.yellowAccent.withOpacity(0.3),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ///

                  InkWell(
                    onTap: () {
                      setState(() {
                        bottomSheetBottomPosition =
                            isCollapsed ? 0 : (bottomSheetBodyHeight * -1.0);

                        isCollapsed = !isCollapsed;
                      });
                    },
                    child: Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      height: bottomSheetButtonHeight,
                      child: Text(
                        "Clips",
                        style: AppTheme.subHeading.copyWith(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),

                  ///

                  Container(
                    height: bottomSheetBodyHeight,
                    width: size.width,
                    decoration: BoxDecoration(
                      color: Colors.redAccent.withOpacity(0.3),
                    ),
                    child: Text('xxx'),
                  ),

                  ///
                ],
              ),
            ),
          ),

          //-----e

          ///
        ],
      ),
    );
  }

  ///
  @override
  void afterFirstLayout(BuildContext context) {
    Future.delayed(
      const Duration(milliseconds: 500),
      () {
        setState(
          () {
            isCollapsed = true;
            bottomSheetBottomPosition = (bottomSheetBodyHeight * -1.0);
          },
        );
      },
    );
  }
}
