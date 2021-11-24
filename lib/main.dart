import 'package:benevolat/provider/benevole.dart';
import 'package:benevolat/screens/homepage.dart';
import 'package:benevolat/screens/new_benevole.dart';
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
        home: HomePage(),
        routes: {
          AddNewBenevole.routeName : (ctx) => AddNewBenevole(),
        },
      ),
    );
  }
}
