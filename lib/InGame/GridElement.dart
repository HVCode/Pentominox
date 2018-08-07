part of game;

class GridElement extends StatelessWidget {
  Color background;
  Color underBackground;
  final int index;
  final int columns;

  final Function _movementValidate;
  final Function _movementAccepted;
  final Function _movementRejected;

  GridElement(
      this._movementValidate,
      this._movementAccepted,
      this._movementRejected,
      this.index,
      this.columns,
      this.background,
      this.underBackground);

  @override
  Widget build(BuildContext context) {
    return new DragTarget<Data>(
      onAccept: (Data d) {

        Set<int> o = new Set<int>();
        o.add(index);
        o.add(index + d.figure.elementAt(0));
        o.add(index + d.figure.elementAt(1));
        o.add(index + d.figure.elementAt(2));
        o.add(index + d.figure.elementAt(3));
        _movementAccepted(o);
      },
      onWillAccept: (Data d) {

        Set<int> o = new Set<int>();
        o.add(index);
        o.add(index + d.figure.elementAt(0));
        o.add(index + d.figure.elementAt(1));
        o.add(index + d.figure.elementAt(2));
        o.add(index + d.figure.elementAt(3));

        return _movementValidate(o);
      },
      onLeave: (Data e) {
        _movementRejected();
      },
      builder: (
        BuildContext context,
        List<Data> accepted,
        List<dynamic> rejected,
      ) {
        return new Container(
          color: background,
          width: MediaQuery.of(context).size.width/15,
          height: MediaQuery.of(context).size.height/15,
        );
      },
    );
  }
}
