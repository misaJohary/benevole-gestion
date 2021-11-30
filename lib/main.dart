import 'package:benevolat/provider/benevole.dart';
import 'package:benevolat/screens/edit_screen.dart';
import 'package:benevolat/screens/homepage.dart';
import 'package:benevolat/screens/new_benevole.dart';
import './screens/get_started.dart';
import '../screens/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BenevoleNotifier(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: GetStarted(),
        // home: HomePage(),
        routes: {
          HomePage.routeName : (ctx) => HomePage(),
          AddNewBenevole.routeName : (ctx) => AddNewBenevole(),
          DetailScreen.routeName : (ctx) => DetailScreen(),
          EditScreen.routeName : (ctx) => EditScreen(),
        },
      ),
    );
  }
}
