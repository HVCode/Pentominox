import 'package:flutter/material.dart';
//import 'package:flutter/animation.dart';
import './OutGame/menu.dart';

void main() => runApp(new Pentomino());

class Pentomino extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Pentomino',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new Game(),
    );
  }
}
/*
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with TickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = new AnimationController(
        duration: const Duration(milliseconds: 5000), vsync: this);
    //animation = new Tween(begin: 0.0, end: 500.0).animate(controller)
    animation = new CurvedAnimation(
      parent: controller,
      curve: Curves.easeIn,
    )
      ..addStatusListener((AnimationStatus status) {
        if (status == AnimationStatus.completed) {
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      })
      ..addListener(() {
        setState(() {});
      });

    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new GrowTransition(child: new Logo2(), animation: this.animation);
    return new Center(
        child: new Container(
          margin: new EdgeInsets.symmetric(
            vertical: 10.0,
          ),
          height: animation.value,
          width: animation.value,
          child:  Animeichon(animation: this.animation,)
          //child : new Imagen();
    ));
  }
}

class Imagen extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new Container(
        child: new ClipRect(
      child: new Align(
        alignment: Alignment.topCenter,
        heightFactor: 0.5,
        child: new Image.asset("images/horario.png"),
      ),
    ));
  }
}

class Animeichon extends AnimatedWidget {
  static final _opacityTween = new Tween<double>(begin: 0.1, end: 1.0);
  static final _sizeTween = new Tween<double>(begin: 0.0, end: 400.0);

  Animeichon({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation2 = listenable;

    return new Center(
      child: new Opacity(
          opacity: _opacityTween.evaluate(animation2),
          child: new Container(
            margin: new EdgeInsets.symmetric(vertical: 10.0),
            height: _sizeTween.evaluate(animation2),
            width: _sizeTween.evaluate(animation2),
            child: new Imagen(),
          ),
    ));
  }
}

class Logo2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      margin: new EdgeInsets.symmetric(vertical: 10.0),
      child: Imagen(),
    );
  }
}

class GrowTransition extends StatelessWidget {
  final Widget child;
  final Animation<double> animation;

  GrowTransition({this.child, this.animation});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Center(
        child: new AnimatedBuilder(
      animation: this.animation,
      builder: (BuildContext context, Widget child) {
        return new Container(
          height: animation.value,
          width: animation.value,
          child: this.child,
        );
      },
      child: this.child,
    ));
  }
}
*/