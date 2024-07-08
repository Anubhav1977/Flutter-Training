import 'package:flutter/material.dart';

class BorderAnimatedContainer extends StatefulWidget {
  const BorderAnimatedContainer({Key? key}) : super(key: key);

  @override
  State<BorderAnimatedContainer> createState() =>
      _BorderAnimatedContainerState();
}

class _BorderAnimatedContainerState extends State<BorderAnimatedContainer> {
  double vAlignment = 0;
  double hAlignment = 0;
  double iconsize = 20;
  final Duration duration = const Duration(milliseconds: 500);

  Future<void> togglePosition(double height, double width) async {
    await changeposition(height * 0.5, width, 20);
    await changeposition(height, width * 0.5, 50);
    await changeposition(height * 0.5, 0, 80);
    await changeposition(0, width * 0.5, 50);
    togglePosition(height, width);
  }

  Future<void> changeposition(double height, double width, double size) async {
    setState(() {
      hAlignment = width;
      vAlignment = height;
      iconsize = size;
    });
    await Future.delayed(duration);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final size = MediaQuery.of(context).size;
      togglePosition(size.height * 0.8, size.width * 0.7);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: const Color(0x4d07f40e),
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedPositioned(
                left: hAlignment,
                top: vAlignment,
                child: const FlutterLogo(
                  size: 100,
                ),
                duration: duration),
            FlutterLogo(
              size: iconsize,
            )
          ],
        ),
      ),
    );
  }
}
