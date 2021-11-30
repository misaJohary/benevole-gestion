import 'package:benevolat/screens/detail_screen.dart';
import 'package:benevolat/screens/new_benevole.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/benevole.dart';

class HomePage extends StatefulWidget {
  static String routeName = './home';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _groupByAvaibility = false;
  bool _showEmpty = false;

  final List<String> _day = [
    'Lundi',
    'Mardi',
    'Mercredi',
    'Jeudi',
    'Vendredi',
    'Samedi',
    'Dimanche'
  ];

  final List<MaterialColor> _color = [
    Colors.cyan,
    Colors.purple,
    Colors.orange,
    Colors.lightGreen,
    Colors.pink,
    Colors.brown,
    Colors.amber
  ];

  @override
  Widget build(BuildContext context) {
    final benevole = Provider.of<BenevoleNotifier>(context);

    List _days = [
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
              showSearch(context: context, delegate: Search(_groupByAvaibility));
            },
            icon: Icon(Icons.search),
          )
        ],
      ),
      drawer: SafeArea(
        child: Drawer(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 150,
                decoration:
                    BoxDecoration(color: Theme.of(context).primaryColor),
                child: Stack(
                  children: [
                    Positioned(
                      left: 50,
                      bottom: 20,
                      width: 200,
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Text('Bienvenue',
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .headline4
                                .copyWith(color: Colors.white),
                            softWrap: true,
                            overflow: TextOverflow.clip),
                      ),
                    ),
                    Positioned(
                      top: 5,
                      right: 5,
                      child: IconButton(
                        onPressed: () {

                        },
                        icon: Icon(
                          Icons.info_outline,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SwitchListTile(title: Text('Grouper par disponibilité'),value: _groupByAvaibility, onChanged: (value){
                setState(() {
                  _groupByAvaibility = value;
                });
              }),
              SwitchListTile(title: Text('Afficher tout les jours'), value: _showEmpty, onChanged: (value){
                setState(() {
                  _showEmpty = value;
                });
              }),
            ],
          ),
        ),
      ),
      body: _groupByAvaibility
          ? SingleChildScrollView(
              child: Column(
                  children: List.generate(
                _days.length,
                (i) => _days[i].length == 0
                    ? _showEmpty? Container(
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
                                        _day[i],
                                        overflow: TextOverflow.fade,
                                        softWrap: false,
                                        style: Theme.of(context)
                                            .textTheme
                                            .caption
                                            .copyWith(
                                                color: Colors.white,
                                                fontSize: 15),
                                      ),
                                    ),
                                    color: _color[i],
                                    height: double.infinity,
                                  )),
                              Expanded(
                                  flex: 5,
                                  child: Container(
                                    color: Colors.black12,
                                    child: Center(
                                        child: Text(
                                      'Aucune personne Disponible',
                                      style: TextStyle(
                                          fontStyle: FontStyle.italic),
                                    )),
                                  )),
                            ]),
                      )  : Container()
                    : Container(
                        margin: EdgeInsets.all(10),
                        height: _days[i].length * 70.0,
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: Container(
                                    child: Center(
                                      child: Text(
                                        _days[i][0].availability,
                                        overflow: TextOverflow.fade,
                                        softWrap: false,
                                        style: Theme.of(context)
                                            .textTheme
                                            .caption
                                            .copyWith(
                                                color: Colors.white,
                                                fontSize: 15),
                                      ),
                                    ),
                                    color: _color[i],
                                    height: double.infinity,
                                  )),
                              Expanded(
                                flex: 5,
                                child: ListView.builder(
                                  itemCount: _days[i].length,
                                  itemBuilder: (ctx, index) => ListTile(
                                    onTap: () {
                                      Navigator.of(context).pushNamed(
                                          DetailScreen.routeName,
                                          arguments: _days[i][index].id);
                                    },
                                    title: Text(_days[i][index].name),
                                    subtitle: Text(_days[i][index].number),
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
                    trailing: Icon(Icons.arrow_forward_ios_rounded,  size: 18,color: Colors.grey),
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


  bool groupBy;

  Search(this.groupBy);

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
        return Column(children: [
                  ListTile(
                    onTap: () {
                      Navigator.of(context).pushNamed(DetailScreen.routeName,
                          arguments: result[index].id);
                    },
                    title: Text(result[index].name),
                    subtitle: Text(result[index].number),
                  ),
                  Divider()
                ]);
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

    result =  groupBy? benevole.benevoles
        .where((element) =>
            element.availability.contains(RegExp("$query", caseSensitive: false)))
        .toList() :  benevole.benevoles
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
