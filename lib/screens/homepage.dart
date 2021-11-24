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
  @override
  Widget build(BuildContext context) {
    final benevole = Provider.of<BenevoleNotifier>(context);

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
      body: ListView.builder(
          itemBuilder: (context, index) {
            return Column(children: [
              ListTile(
                onTap: () {
                  Navigator.of(context).pushNamed(DetailScreen.routeName, arguments:benevole.benevoles[index].id);
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
                showResults(context);
              },
              title: Text(result[index].name),
              subtitle: Text(result[index].number),
            ),
          );
    // throw UnimplementedError();
  }
}
