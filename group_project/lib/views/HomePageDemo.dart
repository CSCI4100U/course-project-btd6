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

class _MyHomePageState extends State<MyHomePage> {
  //Slider content list
  List<ContentConfig> listContent = [];

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
  }

  @override
  Widget build(BuildContext context) {
    return IntroSlider(
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
    );
  }
}
