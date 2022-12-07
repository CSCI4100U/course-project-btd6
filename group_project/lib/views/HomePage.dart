//Frank Delgado (100784073), Date: 2022-12-04
import 'package:flutter/material.dart';
import 'package:group_project/loginPage.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:delayed_display/delayed_display.dart';

//import '../loginPage.dart';

void main() {
  runApp(const HomePageScreen());
}

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

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

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin{
  //Slider content list
  List<ContentConfig> listContent = [];
  //controllers and animations for title and button
  late AnimationController _controllerTitle;
  late Animation<double> _animationTitle;
  late AnimationController _controllerButton;
  late Animation<double> _animationButton;
  late AnimationController _controllerAboutUs;
  late Animation<double> _animationAboutUs;

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
    listContent.add(
      ContentConfig(
        backgroundImage: "assets/homepagesliderimages/grandcanyon.jpg",
        backgroundImageFit: BoxFit.cover,
        backgroundFilterOpacity: 0.5,
        onCenterItemPress: () {},
      ),
    );
    listContent.add(
      ContentConfig(
        backgroundImage: "assets/homepagesliderimages/minegrande.jpg",
        backgroundImageFit: BoxFit.cover,
        backgroundFilterOpacity: 0.5,
        onCenterItemPress: () {},
      ),
    );
    //initialize animation controllers
    _controllerTitle = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    );
    _controllerButton = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    );
    _controllerAboutUs = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    );

    //animations
    _animationTitle = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(_controllerTitle);
    _animationButton = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(_controllerButton);
    _animationAboutUs = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(_controllerButton);
  }
  //animation disposer
  @override
  void dispose() {
    _controllerTitle.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //button style
    final ButtonStyle style = ElevatedButton.styleFrom(
        textStyle: const TextStyle(fontSize: 20));
    //call animation controllers
    _controllerTitle.forward();
    _controllerButton.forward();
    _controllerAboutUs.forward();
    return Scaffold(
      body: Stack(
          alignment: AlignmentDirectional.bottomCenter,
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
              child: DelayedDisplay(
                delay: const Duration(seconds: 2),
                child: FadeTransition(
                  opacity: _animationTitle,
                  child: Container(
                    color: const Color(0xFFFCE4EC).withOpacity(0),
                    height: 200,
                    width: 300,
                    child: const Text(
                      'Rate My Location',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 50,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              color: const Color(0xFFFCE4EC).withOpacity(0),
              alignment: const Alignment(0.00, -0.1),

              child: DelayedDisplay(
                delay: const Duration(seconds: 4),
                child: FadeTransition(
                  opacity: _animationButton,
                  child: SizedBox(
                    width: 200.0,
                    height: 50.0,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => LoginPage())
                        );
                      },
                      style: style,
                      child: const Text('Login'),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              color: const Color(0xFFFCE4EC).withOpacity(0),
              height: 400,
              width: 500,
              alignment: const Alignment(0.00, -0.8),
              //container for title
              child: DelayedDisplay(
                delay: const Duration(seconds: 5),
                child: FadeTransition(
                  opacity: _animationAboutUs,
                  child: SizedBox(
                    height: 50,
                    width: 200,
                    child: ElevatedButton(
                      onPressed: () {
                        _showAboutDialog(context);
                      },
                      style: style,
                      child: const Text('About us'),
                    ),
                  ),
                ),
              ),
            ),
          ]
      ),
    );
  }

  void _showAboutDialog(BuildContext context) {
    showAboutDialog(
      context: context,
      applicationName: 'Dialogs and Navigation',
      applicationVersion: 'Version 0.1.1',
      children: [
        Text('Dialogs and Navigation'),
        Text('Copyright 2020 - Some Person'),
      ],
    );
  }

}