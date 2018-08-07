library game;

import 'dart:async';

import 'package:flutter/material.dart';

part './DragFigure.dart';
part './GridElement.dart';

/*
  - empty slots are going to be blue
  - full slots are going to be of a custom color (yellow, gray, white, black, 
                                                  orange, purple, brown, teal, 
                                                  amber, pink, lime, indigo)
  - a valid slot is going to be green
  - a invalid slot is going to be red
*/

class StartGame extends StatefulWidget {
  int _rows;
  StartGame(this._rows);

  @override
  _StartGameState createState() => new _StartGameState(_rows);
}

class _StartGameState extends State<StartGame> {
  static const int _totalSlots = 60;
  int _rows;
  int _columns;
  String _win;
  List<GridElement> _slots;
  List<GridElement> _slotsCache;

  _StartGameState(this._rows) {
    _columns = _totalSlots ~/ _rows;
    _win = "";
    _slots = new List<GridElement>.generate(_totalSlots, (index) {
      return new GridElement(
          _movementValidated,
          _movementAccepted,
          _movementRejected,
          index,
          _totalSlots ~/ _rows,
          Colors.blue,
          Colors.blue);
    });
    _slotsCache = new List<GridElement>();
    _slotsCache.addAll(_slots);
  }

  void _movementAccepted(Set<int> spread) {
    setState(() {
      _slots = new List<GridElement>.generate(_totalSlots, (index) {
        if (spread.contains(index)) {
          return new GridElement(
              _movementValidated,
              _movementAccepted,
              _movementRejected,
              index,
              _totalSlots ~/ _rows,
              Colors.orange,
              _slotsCache[index].underBackground);
        }
        _slotsCache[index].underBackground = Colors.orange;
        return new GridElement(
            _movementValidated,
            _movementAccepted,
            _movementRejected,
            index,
            _totalSlots ~/ _rows,
            _slotsCache[index].background,
            _slotsCache[index].underBackground);
      });
    });
    _slotsCache.clear();
    _slotsCache.addAll(_slots);

    bool win = true;
    for (var item in _slots) {
      if(item.background != Colors.orange){
        win = false;
        break;
      }
    }
    if(win){
      _win = "Ganaste";
    }
  }

  bool _movementValidated(Set<int> spread) {
    bool result = true;
    Color isAllowed;

    var horizontalValidation = new List.from(spread);
    for (var i = 0; i < horizontalValidation.length; i++) {
      while (horizontalValidation[i] >= _columns) {
        horizontalValidation[i] -= _columns;
      }
    }
    var horizontalValidation_sr = new Set.from(horizontalValidation);//hago esto para eliminar repetidos

    bool b1 = false;
    bool b2 = false;
    bool b3 = false;
    bool colisionHorizontal = false;
    for (var i = 0; i < _columns; i++) {
      
      if (horizontalValidation_sr.contains(i) || b1) {
        b1 = true;
        if ( !horizontalValidation_sr.contains(i) || b2) {
          b2 = true;
          if ( horizontalValidation_sr.contains(i) || b3) {
            b3 = true;
          }
        }
      }
    }

    if(b1 && b2 && b3){
      colisionHorizontal = true;
    }

    //dira que cuadros pintar de verde, rojo o azul
    setState(() {
      _slots = new List<GridElement>.generate(_totalSlots, (index) {
        isAllowed = _slotsCache[index].background;
        
        if (spread.any((e) => e < 0 || e > 60) || colisionHorizontal) { 
          result = false;
        } else {
          if (spread.contains(index)) {
            if (_slotsCache[index].background == Colors.blue) {
              isAllowed = Colors.green;
            } else {
              isAllowed = Colors.red;
              result = false;
            }
          }
        }
        _slotsCache[index].underBackground = _slotsCache[index].background;
        return new GridElement(
            _movementValidated,
            _movementAccepted,
            _movementRejected,
            index,
            _totalSlots ~/ _rows,
            isAllowed,
            _slotsCache[index].underBackground);
      });
    });
    _slotsCache.clear();
    _slotsCache.addAll(_slots);

    return result;
  }

  void _movementRejected() {
    setState(() {
      _slots = new List<GridElement>.generate(_totalSlots, (index) {
        return new GridElement(
          _movementValidated,
          _movementAccepted,
          _movementRejected,
          index,
          _totalSlots ~/ _rows,
          _slotsCache[index].underBackground,
          _slotsCache[index].underBackground,
        );
      });
    });
    _slotsCache.clear();
    _slotsCache.addAll(_slots);
  }

  @override
  Widget build(BuildContext context) {

    if(_win == "Ganaste"){
      new Future.delayed(const Duration(seconds: 2),()=> 
      Navigator.of(context).pop()
      );
    }

    var con = new Container(
      child: Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          new Divider(),
          new Container(
            child: new GridView.count(
              scrollDirection: Axis.vertical,
              crossAxisSpacing: 4.0,
              mainAxisSpacing: 4.0,
              crossAxisCount: (_totalSlots ~/ _rows),
              children: _slots,
              shrinkWrap: true,
              //maxCrossAxisExtent: 20.0,
            ),
            padding:
                EdgeInsets.only(left: 6.0, right: 6.0, bottom: 6.0, top: 6.0),
            decoration: new BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(6.0),
            ),
            height: MediaQuery.of(context).size.height / 2.3,
          ),
          new SetOfFigures(_totalSlots ~/ _rows),
        ],
      ),
    ),
    );
    return new Stack(
      children: <Widget>[
        new Positioned.fill(
          child: con,
        ),
        new Positioned(
          top: MediaQuery.of(context).size.height/2,
          left: MediaQuery.of(context).size.width/6 ,
          child: Text(_win),
        )
      ],
    );
  }
}
