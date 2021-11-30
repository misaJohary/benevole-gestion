import 'package:benevolat/screens/homepage.dart';
import 'package:flutter/material.dart';

class GetStarted extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,      
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Welcome', style: Theme.of(context).textTheme.headline4,),
                RaisedButton(color: Theme.of(context).primaryColor , textColor: Colors.white,onPressed: (){
                  Navigator.of(context).pushReplacementNamed(HomePage.routeName);
                }, child: Text('Get Started...')),
              ],
            ),
          )
          ,
          Center(child: Text('Gestionnaire de Bénévole', textAlign: TextAlign.center,style: Theme.of(context).textTheme.headline4,),),
        
        Container(
          
          decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/handsup.png'), fit: BoxFit.cover),),
          width: double.infinity,
          height: 400,
        )
      ],),
    ));
  }
}