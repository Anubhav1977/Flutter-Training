import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedContainerWidget extends StatefulWidget {
  const AnimatedContainerWidget({Key? key}) : super(key: key);

  @override
  State<AnimatedContainerWidget> createState() =>
      _AnimatedContainerWidgetState();
}

class _AnimatedContainerWidgetState extends State<AnimatedContainerWidget> {
  double width = 200;
  double height = 100;
  double top = 100;
  double left = 70;
  BorderRadiusGeometry borderradius = BorderRadius.circular(20);
  Color color = Colors.red;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animated Conatiner"),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.black26,
        child: Stack(
          children: [
            Positioned(
              top: top,
              left: left,
              child: AnimatedContainer(
                height: height,
                width: width,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: borderradius,
                ),
                duration: Duration(seconds: 1),
                curve: Curves.fastEaseInToSlowEaseOut,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 620, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        width = Random().nextDouble() * 300;
                        height = Random().nextDouble() * 300;
                      });
                    },
                    child: Text("CHANGE"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        top = Random().nextDouble() * 300;
                        left = Random().nextDouble() * 100;
                      });
                    },
                    child: Text("MOVE"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        color = Color.fromRGBO(Random().nextInt(256),
                            Random().nextInt(256), Random().nextInt(256), 1);
                      });
                    },
                    child: Text("Color"),
),
],
),
),
],
),
),
);
}
}
