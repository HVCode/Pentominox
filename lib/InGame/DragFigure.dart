part of game;

class Data {
  final Color color;
  final Image image;
  final Set<int> figure;
  static const int columns = _StartGameState._totalSlots;
  Data(this.color, this.image, this.figure);
}

class DragFigure extends StatelessWidget {
  final Data _data;

  DragFigure(this._data);

  @override
  Widget build(BuildContext context) {
    return Draggable(
      data: new Data(_data.color, _data.image, _data.figure), //_data
      child: new Container(
        child: new Column(
          children: <Widget>[
            Text("data"),
          ],
        ),
        color: _data.color,
      ),
      feedback: new Center(
        child: new Container(
          width: MediaQuery.of(context).size.height/15,
          height: MediaQuery.of(context).size.height/15,
          decoration: new BoxDecoration(
            shape:BoxShape.circle,
            color: Colors.amber,
          ),
        ),
      ),
    );
  }
}
class SetOfFigures extends StatelessWidget {
  
  final int columns;
  DragFigure figure_F;
  DragFigure figure_I;
  DragFigure figure_L;
  DragFigure figure_N;
  DragFigure figure_P;
  DragFigure figure_T;
  DragFigure figure_U;
  DragFigure figure_V;
  DragFigure figure_W;
  DragFigure figure_X;
  DragFigure figure_Y;
  DragFigure figure_Z;

  SetOfFigures(this.columns) {
    var coord1 = new Set<int>()
      ..add(-1)
      ..add(-columns)
      ..add(-columns + 1)
      ..add(columns);
    figure_F = new DragFigure(new Data(Colors.yellow, null, coord1));

    var coord2 = new Set<int>()
      ..add(-columns)
      ..add(-columns * 2)
      ..add(columns)
      ..add(columns * 2);
    figure_I = new DragFigure(new Data(Colors.blue, null, coord2));

    var coord3 = new Set<int>()
      ..add(-columns)
      ..add(-columns * 2)
      ..add(columns)
      ..add(columns + 1);
    figure_L = new DragFigure(new Data(Colors.grey, null, coord3));

    var coord4 = new Set<int>()
      ..add(1)
      ..add(-columns + 1)
      ..add(columns)
      ..add(columns * 2);
    figure_N = new DragFigure(new Data(Colors.green, null, coord4));

    var coord5 = new Set<int>()
      ..add(-columns)
      ..add(-1)
      ..add(columns)
      ..add(columns - 1);
    figure_P = new DragFigure(new Data(Colors.purple, null, coord5));

    var coord6 = new Set<int>()
      ..add(-columns)
      ..add(-columns + 1)
      ..add(-columns - 1)
      ..add(columns);
    figure_T = new DragFigure(new Data(Colors.black, null, coord6));

    var coord7 = new Set<int>()
      ..add(-1)
      ..add(1)
      ..add(-columns + 1)
      ..add(-columns - 1);
    figure_U = new DragFigure(new Data(Colors.orange, null, coord7));

    var coord8 = new Set<int>()
      ..add(1)
      ..add(2)
      ..add(-columns)
      ..add(-columns * 2);
    figure_V = new DragFigure(new Data(Colors.teal, null, coord8));

    var coord9 = new Set<int>()
      ..add(-1)
      ..add(-columns - 1)
      ..add(columns + 1)
      ..add(columns);
    figure_W = new DragFigure(new Data(Colors.brown, null, coord9));

    var coord10 = new Set<int>()
      ..add(-columns)
      ..add(-1)
      ..add(1)
      ..add(columns);
    figure_X = new DragFigure(new Data(Colors.white, null, coord10));

    var coord11 = new Set<int>()
      ..add(-1)
      ..add(-columns)
      ..add(columns)
      ..add(columns * 2);
    figure_Y = new DragFigure(new Data(Colors.pink, null, coord11));

    var coord12 = new Set<int>()
      ..add(-columns - 1)
      ..add(-columns)
      ..add(columns + 1)
      ..add(columns);
    figure_Z = new DragFigure(new Data(Colors.indigo, null, coord12));
  }
  @override
  Widget build(BuildContext context) {
    return new Expanded(
      child: new Column(
        children: <Widget>[
          new Expanded(
            child: new Row(
              children: <Widget>[
                new Expanded(child: figure_F),
                new Expanded(child: figure_I),
                new Expanded(child: figure_L),
                new Expanded(child: figure_N),
              ],
            ),
          ),
          new Expanded(
            child: new Row(
              children: <Widget>[
                new Expanded(child: figure_P),
                new Expanded(child: figure_T),
                new Expanded(child: figure_U),
                new Expanded(child: figure_V),
              ],
            ),
          ),
          new Expanded(
            child: new Row(
              children: <Widget>[
                new Expanded(child: figure_W),
                new Expanded(child: figure_X),
                new Expanded(child: figure_Y),
                new Expanded(child: figure_Z),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
