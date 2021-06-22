import 'package:flutter/material.dart';
import 'package:flutter_onboarding/constant.dart';
import 'package:flutter_onboarding/flutter_onboarding.dart';
import 'package:flutter_onboarding/on_board_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter OnBoarding',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ExampleScreen(),
    );
  }
}

class ExampleScreen extends StatelessWidget {
  final List<OnBoardPage> list = [
    OnBoardPage(
        title: Text(
          "Find Food You Love",
          style: TextStyle(
              fontWeight: FontWeight.w800, fontSize: 32, letterSpacing: 1.0),
        ),
        content: Text(
            "Discover the best foods from over 1,000 restaurants and fast delivery to your doorstep"),
        image: AssetImage("assets/vector1.png")),
    OnBoardPage(
        title: Text(
          "Fast Delivery",
          style: TextStyle(
              fontWeight: FontWeight.w800, fontSize: 32, letterSpacing: 1.0),
        ),
        content:
        Text("Fast food delivery to your home, office wherever you are"),
        image: AssetImage("assets/vector2.png")),
    OnBoardPage(
        title: Text(
          "Live Tracking",
          style: TextStyle(
              fontWeight: FontWeight.w800, fontSize: 32, letterSpacing: 1.0),
        ),
        content: Text(
            "Real time tracking of your food on the app once you placed the order"),
        image: AssetImage("assets/vector3.png")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnBoardingScreen(
          getStartedText: Text(
            "Get Started",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w800, fontSize: 16),
          ),
          getStartedColor: orange,
          list: list,
          pageRoute: MaterialPageRoute(builder: (context) => new MyHomePage())),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    );
  }
}
