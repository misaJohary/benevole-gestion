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
        body: Column(
          children: [
            Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(color: Theme.of(context).primaryColor),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                    IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
                  ],),
                  Text(benevoleSelected.name,
                    style: Theme.of(context).textTheme.headline4,)
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    benevoleSelected.name,
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  RichText(
                    text: TextSpan(
                        text: 'Contact : ',
                        style: Theme.of(context)
                            .textTheme
                            .caption
                            .copyWith(fontStyle: FontStyle.italic, fontSize: 15),
                        children: [
                          TextSpan(
                            text: benevoleSelected.number,
                            style: Theme.of(context).textTheme.bodyText1.copyWith(
                                color: Colors.blueGrey,
                                fontStyle: FontStyle.normal),
                          ),
                        ]),
                  ),
                  RichText(
                    text: TextSpan(
                        text: 'E-mail : ',
                        style: Theme.of(context)
                            .textTheme
                            .caption
                            .copyWith(fontStyle: FontStyle.italic, fontSize: 15),
                        children: [
                          TextSpan(
                            text: benevoleSelected.email,
                            style: Theme.of(context).textTheme.bodyText1.copyWith(
                                color: Colors.blueGrey,
                                fontStyle: FontStyle.normal),
                          ),
                        ]),
                  ),
                  RichText(
                    text: TextSpan(
                        text: 'Adresse : ',
                        style: Theme.of(context)
                            .textTheme
                            .caption
                            .copyWith(fontStyle: FontStyle.italic, fontSize: 15),
                        children: [
                          TextSpan(
                            text: benevoleSelected.adresse,
                            style: Theme.of(context).textTheme.bodyText1.copyWith(
                                color: Colors.blueGrey,
                                fontStyle: FontStyle.normal),
                          ),
                        ]),
                  ),
                  RichText(
                    text: TextSpan(
                        text: 'Profession : ',
                        style: Theme.of(context)
                            .textTheme
                            .caption
                            .copyWith(fontStyle: FontStyle.italic, fontSize: 15),
                        children: [
                          TextSpan(
                            text: benevoleSelected.profession,
                            style: Theme.of(context).textTheme.bodyText1.copyWith(
                                color: Colors.blueGrey,
                                fontStyle: FontStyle.normal),
                          ),
                        ]),
                  ),
                  RichText(
                    text: TextSpan(
                        text: 'Disponibilité : ',
                        style: Theme.of(context)
                            .textTheme
                            .caption
                            .copyWith(fontStyle: FontStyle.italic, fontSize: 15),
                        children: [
                          TextSpan(
                            text: benevoleSelected.availability,
                            style: Theme.of(context).textTheme.bodyText1.copyWith(
                                color: Colors.blueGrey,
                                fontStyle: FontStyle.normal),
                          ),
                        ]),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
