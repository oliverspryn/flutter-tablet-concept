import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tablet_concept/ui/RandomWords.dart';

class TabletConceptApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.white,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));

    return MaterialApp(
      title: 'Startup Name Generator',
      theme: ThemeData(
        primaryColor: Colors.white,
        primaryColorDark: Colors.white,
      ),
      home: new RandomWords(),
    );
  }
}
