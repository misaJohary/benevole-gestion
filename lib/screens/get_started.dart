import 'package:flutter/material.dart';

class GetStarted extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Center(child: Text('Bienvenue dans l\'outils Gestion de Bénévole', textAlign: TextAlign.center,style: Theme.of(context).textTheme.headline4,),),
        
        Container(
          
          decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/handsup.png'), fit: BoxFit.cover),),
          width: double.infinity,
          height: 400,
        )
      ],),
    ));
  }
}