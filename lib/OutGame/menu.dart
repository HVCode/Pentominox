library menu;

import 'package:flutter/material.dart';
import 'package:pentominox/InGame/StartGame.dart';
part './buttonsState.dart';
part './PickDimentionState.dart';
part './banner.dart';

class Game extends StatefulWidget {
  @override
  _GameState createState() => new _GameState();
}

class _GameState extends State<Game> {
  bool _wasPickPress;
  bool _wasCredictsPress;
  int _dimentionSelected;

  _GameState() {
    _dimentionSelected = 6;
  }

  @override
  void initState() {
    _wasPickPress = false;
    _wasCredictsPress = false;
    buttons.play.action = () {
      Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
        return new StartGame(_dimentionSelected);
      }));
    };
    buttons.pickDimention.action = () {
      setState(() {
        _wasPickPress = true;
      });
    };
    buttons.credits.action = () {};

    setOfDimentionOptions =
        new SetOfDimentionOptions(_dimentionSelected, changeDimention);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double heightScreen = MediaQuery.of(context).size.height;
    double textMain = heightScreen * 0.06;

    setOfDimentionOptions.d6x10.groupVal = _dimentionSelected;
    setOfDimentionOptions.d5x12.groupVal = _dimentionSelected;
    setOfDimentionOptions.d4x15.groupVal = _dimentionSelected;
    setOfDimentionOptions.d3x20.groupVal = _dimentionSelected;

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Pentomino: project by hilmer vivas"),
      ),
      body: new Center(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            new Container(
              height: heightScreen * 0.5,
              child: new Center(
                child: new Text(
                  "Pentominox",
                  style: new TextStyle(color: Colors.cyan, fontSize: textMain),
                ),
              ),
            ),
            pickState(_wasPickPress),
          ],
        ),
      ),
    );
  }

  void changeDimention(int a) {
    _dimentionSelected = a;
    setState(() {
      //para regresar de una vez al menu
      _wasPickPress = false;
    });
  }

  Widget pickState(bool select) {
    if (select) {
      return setOfDimentionOptions;
    } else {
      return buttons;
    }
  }
}
