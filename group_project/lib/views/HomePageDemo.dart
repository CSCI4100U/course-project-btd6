//Frank Delgado (100784073), Date: 2022-12-04
import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rate My Location',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Rate My Location'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{
  //Slider content list
  List<ContentConfig> listContent = [];
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    //adding to the content of the slider
    listContent.add(
      ContentConfig(
        backgroundImage: "assets/homepagesliderimages/eiffel-tower-night_2x3.png",
        backgroundImageFit: BoxFit.cover,
        backgroundFilterOpacity: 0.5,
        onCenterItemPress: () {},
      ),
    );
    listContent.add(
      ContentConfig(
        backgroundImage: "assets/homepagesliderimages/stonehenge.jpg",
        backgroundImageFit: BoxFit.cover,
        backgroundFilterOpacity: 0.5,
        onCenterItemPress: () {},
      ),
    );
    listContent.add(
      ContentConfig(
        backgroundImage: "assets/homepagesliderimages/cntower.jpg",
        backgroundImageFit: BoxFit.cover,
        backgroundFilterOpacity: 0.5,
        onCenterItemPress: () {},
      ),
    );
    //initialize animation controller
    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    );

    //fade animation
    _animation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(_controller);
  }
  //animation disposer
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //button style
    final ButtonStyle style = ElevatedButton.styleFrom(
        textStyle: const TextStyle(fontSize: 20));
    _controller.forward();
    return Scaffold(
      body: Stack(
          alignment: AlignmentDirectional.center,
          children: <Widget>[
            IntroSlider(
              key: UniqueKey(),

              //configuring slider content
              listContentConfig: listContent,
              //backgroundColorAllTabs: Colors.grey,

              //scroll behaviour
              isAutoScroll: true,
              isLoopAutoScroll: true,

              //indicator config
              indicatorConfig: const IndicatorConfig(
                isShowIndicator: false,
              ),

              //hiding buttons
              isShowSkipBtn: false,
              isShowNextBtn: false,
              isShowPrevBtn: false,
              isShowDoneBtn: false,

            ),
            //Container base for Title and button
            Container(
              color: const Color(0xFFFCE4EC).withOpacity(0),
              alignment: const Alignment(0.04, -0.6),
              //container for title
              child: Container(
                color: const Color(0xFFFCE4EC).withOpacity(0.5),
                height: 50,
                width: 200,
                child: const Text(
                  'Rate My Location',
                  style: TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: style,
              child: const Text('Login'),
            ),
          ]
      ),
    );
  }
}