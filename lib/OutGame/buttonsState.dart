part of menu;

class Button extends StatelessWidget {
  final String _text;
  final Color _color;
  final Color _textColor;
  Function action;

  Button(this._text, this._textColor, this._color);

  @override
  Widget build(BuildContext context) {
    Text text = new Text(
      _text,
      style: new TextStyle(
        color: _textColor,
        fontSize: MediaQuery.of(context).size.height * 0.03,
      ),
    );
    return new Expanded(
      child: new Container(
        child: new RaisedButton(
          child: text,
          color: _color,
          onPressed: action,
          highlightElevation: 20.0,
          animationDuration: Duration(milliseconds: 5),
          splashColor: Colors.transparent,
          highlightColor: Colors.redAccent,
        ),
        decoration: new BoxDecoration(
          color: Colors.blueGrey,
          border: Border.all(color: Colors.amber, width: 10.0),
        ),
      ),
    );
  }
}

final Button playButton = new Button("Play", Colors.red, Colors.indigoAccent);
final Button pickDimentionButton = new Button("Pick a dimention", Colors.red, Colors.purpleAccent);
final Button creditsButton = new Button("Credits", Colors.red, Colors.greenAccent);

class SetOfButtons extends StatelessWidget{
  final Button play = playButton;
  final Button pickDimention = pickDimentionButton;
  final Button credits = creditsButton;

  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return new Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            playButton,
            pickDimentionButton,
            creditsButton,
          ],
        ),
      );
    }
}

final SetOfButtons buttons = new SetOfButtons();


