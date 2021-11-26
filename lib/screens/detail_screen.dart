import 'package:benevolat/screens/edit_screen.dart';
import 'package:benevolat/screens/new_benevole.dart';
import 'package:benevolat/widgets/info.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/benevole.dart';

class DetailScreen extends StatelessWidget {
  static String routeName = './detail-screen';

  @override
  Widget build(BuildContext context) {
    final String args = ModalRoute.of(context).settings.arguments;
    final benevoleData = Provider.of<BenevoleNotifier>(context).benevoles;
    final Benevole benevoleSelected =
        benevoleData.firstWhere((element) => element.id == args);

    return Scaffold(
        // appBar: AppBar(
        //   toolbarHeight: 150,
        //   title: Text('Details'),
        //   actions: [
        //     IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
        //   ],
        // ),
        body: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 150,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(30)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey, offset: Offset(0, 5), blurRadius: 10)
                ]),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Icon(Icons.arrow_back_rounded),
                        color: Colors.white),
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed(EditScreen.routeName, arguments: args);
                        },
                        icon: Icon(Icons.edit),
                        color: Colors.white),
                  ],
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      benevoleSelected.name,
                      softWrap: true,
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .headline4
                          .copyWith(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Info(
                    title: 'Contact',
                    info: benevoleSelected.number,
                  ),
                  Info(
                    title: 'E-mail',
                    info: benevoleSelected.email,
                  ),
                  Info(
                    title: 'Adresse',
                    info: benevoleSelected.adresse,
                  ),
                  Info(
                    title: 'Profession',
                    info: benevoleSelected.profession,
                  ),
                  Info(
                    title: 'Disponibilité',
                    info: benevoleSelected.availability,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}

