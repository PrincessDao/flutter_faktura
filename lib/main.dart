import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_faktura/Home.dart';
import 'CodeSubscription.dart';
import 'ProfileScreen.dart';
import 'Screens3.dart';
import 'Screens4.dart';
import 'dart:io';
import 'globals.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      theme: ThemeData.light().copyWith(
          splashFactory: NoSplash.splashFactory,
          navigationBarTheme: NavigationBarThemeData(
            indicatorShape: null,
            backgroundColor: Color(0xFF292929),
            surfaceTintColor: Color(0xFF292929),
            indicatorColor: Color(0xFF292929),
            labelTextStyle: MaterialStateProperty.resolveWith<TextStyle?>(
                  (Set<MaterialState> states) {
                if (states.contains(MaterialState.selected)) {
                  return TextStyle(
                    fontStyle: FontStyle.normal,
                    color: Color(0xFF4C85FF),
                    fontSize: 12.0,
                  );
                }
                return TextStyle(
                  fontStyle: FontStyle.normal,
                  color: Color(0xFFFFFFFF),
                  fontSize: 12.0,
                );
              },
            ),
          )
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: Stack(
        children: [
          Container(
            color: Color(0xFFFFFFFF),
            child: IndexedStack(
              index: _currentIndex,
              children: [
                Navigator(
                  onGenerateRoute: (settings) {
                    return MaterialPageRoute(
                      builder: (context) => CodeSubscription(),
                    );
                  },
                ),
                Navigator(
                  onGenerateRoute: (settings) {
                    return MaterialPageRoute(
                      builder: (context) => ProfileScreen(),
                    );
                  },
                ),
                Navigator(
                  onGenerateRoute: (settings) {
                    return MaterialPageRoute(
                      builder: (context) => Screens3(),
                    );
                  },
                ),
                Navigator(
                  onGenerateRoute: (settings) {
                    return MaterialPageRoute(
                      builder: (context) => Screens4(),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(right: 10.0, left: 10.0, bottom: 5.0),
            color: Colors.transparent,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(45.0),
              child: Container(
                padding: EdgeInsets.only(right: 10.0, left: 10.0),
                color: Color(0xFF292929),
                child: NavigationBar(
                  height: 70.0,
                  selectedIndex:  _currentIndex,
                  onDestinationSelected: (int index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  destinations: const <Widget>[
                    NavigationDestination(
                      tooltip: '',
                      icon: Image(
                        image: AssetImage('lib/assets/home/tabOneWhite.png'),
                        fit: BoxFit.contain,
                        width: 27,
                        height: 27,
                      ),
                      selectedIcon: Image(
                        image: AssetImage('lib/assets/home/tabOneBlue.png'),
                        fit: BoxFit.contain,
                        width: 27,
                        height: 27,
                      ),
                      label: 'Виталий',
                    ),
                    NavigationDestination(
                      tooltip: '',
                      icon: Image(
                        image: AssetImage('lib/assets/home/tabTwoWhite.png'),
                        fit: BoxFit.contain,
                        width: 27,
                        height: 27,
                      ),
                      selectedIcon: Image(
                        image: AssetImage('lib/assets/home/tabTwoBlue.png'),
                        fit: BoxFit.contain,
                        width: 27,
                        height: 27,
                      ),
                      label: 'Яна',
                    ),
                    NavigationDestination(
                      tooltip: '',
                      icon: Image(
                        image: AssetImage('lib/assets/home/tabThreeWhite.png'),
                        fit: BoxFit.contain,
                        width: 27,
                        height: 27,
                      ),
                      selectedIcon: Image(
                        image: AssetImage('lib/assets/home/tabThreeBlue.png'),
                        fit: BoxFit.contain,
                        width: 27,
                        height: 27,
                      ),
                      label: 'Иннокентий',
                    ),
                    NavigationDestination(
                      tooltip: '',
                      icon: Image(
                        image: AssetImage('lib/assets/home/tabFourWhite.png'),
                        fit: BoxFit.contain,
                        width: 27,
                        height: 27,
                      ),
                      selectedIcon: Image(
                        image: AssetImage('lib/assets/home/tabFourBlue.png'),
                        fit: BoxFit.contain,
                        width: 27,
                        height: 27,
                      ),
                      label: 'Никита',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}