part of menu;

class DimentionOption extends StatelessWidget {
  int val;
  int groupVal;
  Function onChan;
  String label;

  @override
  Widget build(BuildContext context) {
    return new Expanded(
      child: new Container(
        child: new Column(
          children: <Widget>[
            new Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                new Text(label),
                new Radio<int>(
                  value: val,
                  groupValue: groupVal,
                  onChanged: onChan,
                  activeColor: Colors.cyan,
                ),
              ],
            ),
            new Center(child: new Text("imagen")
                //child: new Image.asset("name"),
                ),
          ],
        ),
        color: Colors.amber,
      ),
    );
  }
}

class SetOfDimentionOptions extends StatelessWidget {
  final DimentionOption d6x10 = new DimentionOption();
  final DimentionOption d5x12 = new DimentionOption();
  final DimentionOption d4x15 = new DimentionOption();
  final DimentionOption d3x20 = new DimentionOption();

  SetOfDimentionOptions(int groupValue, Function onChange) {
    d6x10.label = "6 x 10";
    d6x10.val = 6;
    d6x10.onChan = onChange;
    d6x10.groupVal = groupValue;

    d5x12.label = "5 x 12";
    d5x12.val = 5;
    d5x12.onChan = onChange;
    d5x12.groupVal = groupValue;

    d4x15.label = "4 x 15";
    d4x15.val = 4;
    d4x15.onChan = onChange;
    d4x15.groupVal = groupValue;

    d3x20.label = "3 x 20";
    d3x20.val = 3;
    d3x20.onChan = onChange;
    d3x20.groupVal = groupValue;
  }

  @override
  Widget build(BuildContext context) {
    return new Expanded(
      child: new Column(
        children: <Widget>[
          new Expanded(
            child: new Row(
              children: <Widget>[d6x10, d5x12],
            ),
          ),
          new Expanded(
            child: new Row(
              children: <Widget>[d4x15, d3x20],
            ),
          ),
        ],
      ),
    );
  }
}

SetOfDimentionOptions setOfDimentionOptions;
