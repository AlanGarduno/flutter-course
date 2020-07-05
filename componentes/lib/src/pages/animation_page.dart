import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedPage extends StatefulWidget {
  @override
  _AnimatedPageState createState() => _AnimatedPageState();
}

class _AnimatedPageState extends State<AnimatedPage> {
  
  double _width = 50.0;
  double _heigth = 50.0;
  Color _color = Colors.pink;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animcaion'),
      ),
      body: Center(
        child: AnimatedContainer(
          width: _width,
          height: _heigth,
          duration: Duration(seconds: 1),
          curve: Curves.bounceInOut,
          decoration: BoxDecoration(
            borderRadius: _borderRadius,
            color: _color,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.cached),
        onPressed: () {
          final random = Random();
          
          setState(() {
            _width = random.nextInt(300).toDouble();
            _heigth = random.nextInt(300).toDouble();
            _color = Color.fromRGBO(
              random.nextInt(255),
              random.nextInt(255),
              random.nextInt(255),
              1);
            _borderRadius =BorderRadius.circular(random.nextInt(100).toDouble());
          });
        },
      ),
    );
  }
}