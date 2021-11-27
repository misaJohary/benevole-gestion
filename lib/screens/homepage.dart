import 'package:benevolat/screens/detail_screen.dart';
import 'package:benevolat/screens/new_benevole.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/benevole.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _groupByAvaibility = true;

  final List<String> day = [
    'Lundi',
    'Mardi',
    'Mercredi',
    'Jeudi',
    'Vendredi',
    'Samedi',
    'Dimanche'
  ];

  @override
  Widget build(BuildContext context) {
    final benevole = Provider.of<BenevoleNotifier>(context);

    List days = [
      benevole.benevoles
          .where((element) => element.availability == 'Lundi')
          .toList(),
      benevole.benevoles
          .where((element) => element.availability == 'Mardi')
          .toList(),
      benevole.benevoles
          .where((element) => element.availability == 'Mercredi')
          .toList(),
      benevole.benevoles
          .where((element) => element.availability == 'Jeudi')
          .toList(),
      benevole.benevoles
          .where((element) => element.availability == 'Vendredi')
          .toList(),
      benevole.benevoles
          .where((element) => element.availability == 'Samedi')
          .toList(),
      benevole.benevoles
          .where((element) => element.availability == 'Dimanche')
          .toList(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Liste des bénévoles'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: Search());
            },
            icon: Icon(Icons.search),
          )
        ],
      ),
      drawer: Drawer(),
      body: _groupByAvaibility
          ? SingleChildScrollView(
            child: Column(children :List.generate(
                days.length,
                (i) => days[i].length == 0
                    ? Container(
                        margin: EdgeInsets.all(10),
                        height: 70,
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: Container(
                                    child: Center(
                                      child: Text(
                                        day[i],
                                        // days[0][0].availability,
                                        style: Theme.of(context)
                                            .textTheme
                                            .caption
                                            .copyWith(
                                                color: Colors.white,
                                                fontSize: 15),
                                      ),
                                    ),
                                    color: Colors.cyan,
                                    height: double.infinity,
                                  )),
                              Expanded(
                                  flex: 5,
                                  child: Center(
                                      child: Text('Aucune personne Disponible'))),
                            ]),
                      )
                    : Container(
                        margin: EdgeInsets.all(10),
                        height: days[i].length * 70.0,
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: Container(
                                    child: Center(
                                      child: Text(
                                        days[i][0].availability,
                                        style: Theme.of(context)
                                            .textTheme
                                            .caption
                                            .copyWith(
                                                color: Colors.white,
                                                fontSize: 15),
                                      ),
                                    ),
                                    color: Colors.cyan,
                                    height: double.infinity,
                                  )),
                              Expanded(
                                flex: 5,
                                child: ListView.builder(
                                  itemCount: days[i].length,
                                  itemBuilder: (ctx, index) => ListTile(
                                    onTap: () {},
                                    title: Text(days[i][index].name),
                                    subtitle: Text(days[i][index].number),
                                  ),
                                ),
                              ),
                            ]),
                      ),
              ).toList()),
          )
          : ListView.builder(
              itemBuilder: (context, index) {
                return Column(children: [
                  ListTile(
                    onTap: () {
                      Navigator.of(context).pushNamed(DetailScreen.routeName,
                          arguments: benevole.benevoles[index].id);
                    },
                    title: Text(benevole.benevoles[index].name),
                    subtitle: Text(benevole.benevoles[index].number),
                  ),
                  Divider()
                ]);
              },
              itemCount: benevole.benevoles.length),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).pushNamed(AddNewBenevole.routeName);
        },
      ),
    );
  }
}

class Search extends SearchDelegate {
  List result = [];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // leading icon on the left of the appBar
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return ListView.builder(
      itemCount: result.length,
      itemBuilder: (context, index) {
        return Text(result[index].name);
        // return ListTile(
        //   title: result[index].name,
        //   subtitle: result[index].number,
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // show when someone searches for something

    final benevole = Provider.of<BenevoleNotifier>(context, listen: false);

    result = benevole.benevoles
        .where((element) =>
            element.name.contains(RegExp("$query", caseSensitive: false)))
        .toList();

    return query.isEmpty
        ? Container()
        : ListView.builder(
            itemCount: result.length,
            itemBuilder: (context, index) => ListTile(
              onTap: () {
                Navigator.of(context).pushNamed(DetailScreen.routeName,
                    arguments: result[index].id);
                // showResults(context);
              },
              title: Text(result[index].name),
              subtitle: Text(result[index].number),
            ),
          );
    // throw UnimplementedError();
  }
}
