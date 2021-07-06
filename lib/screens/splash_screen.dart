import 'package:flutter/material.dart';
import 'package:loginapp/screens/intro_screen.dart';

class SplashScreen extends StatefulWidget {
  final Color backgroundColor = Colors.white;
  final TextStyle styleTextUnderTheLoader = TextStyle(
      fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin{

  AnimationController? _animationController;

  

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds:1),
      lowerBound: 0.6,
      upperBound: 1
      );
      _animationController!.addStatusListener((status) async {
        if(status==AnimationStatus.completed){
         Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => IntroScreen()),
    );
        }
      });
      _animationController!.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: InkWell(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                 ScaleTransition(
                   scale: _animationController!,
                                    child: Container(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          'assets/images/logo.png',
                          height: 300,
                          width: 300,
                        ),
                        Padding(                        padding: const EdgeInsets.only(top: 10.0),
                        ),
                      ],
                    )),
                 ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }
}