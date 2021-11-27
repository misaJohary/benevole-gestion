import 'package:benevolat/provider/benevole.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditScreen extends StatefulWidget {
  static String routeName = './edit-screen';

  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final _form = GlobalKey<FormState>();
  Benevole newBenevole = Benevole(
    id: '',
    name: '',
    number: '',
    email: '',
    adresse: '',
    profession: '',
    availability: '',
  );

  var _initValue = {
    'id': '',
    'name': '',
    'number': '',
    'email': '',
    'adresse': '',
    'profession': '',
    'availability': '',
  };

  bool _isInit = true;

  String args = null;

  _saveForm() {
    _form.currentState.save();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      args = ModalRoute.of(context).settings.arguments as String;
      final benevoleData = Provider.of<BenevoleNotifier>(context).benevoles;
      newBenevole = benevoleData.firstWhere((element) => element.id == args);
      _initValue = {
        'id': newBenevole.id,
        'name': newBenevole.name,
        'number': newBenevole.number,
        'email': newBenevole.email,
        'adresse': newBenevole.adresse,
        'profession': newBenevole.profession,
        'availability': newBenevole.availability,
      };
    }

    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editer'),
        // centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _form,
          child: ListView(
            children: [
              TextFormField(
                initialValue: _initValue['name'],
                decoration: InputDecoration(labelText: 'Nom et Prénom : '),
                textInputAction: TextInputAction.next,
                onSaved: (value) {
                  newBenevole = Benevole(
                    id: newBenevole.id,
                    name: value,
                    number: newBenevole.number,
                    email: newBenevole.email,
                    adresse: newBenevole.adresse,
                    profession: newBenevole.profession,
                    availability: newBenevole.availability,
                  );
                },
              ),
              TextFormField(
                initialValue: _initValue['number'],
                decoration: InputDecoration(labelText: 'Contact : '),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.phone,
                onSaved: (value) {
                  newBenevole = Benevole(
                    id: newBenevole.id,
                    name: newBenevole.name,
                    number: value,
                    email: newBenevole.email,
                    adresse: newBenevole.adresse,
                    profession: newBenevole.profession,
                    availability: newBenevole.availability,
                  );
                },
              ),
              TextFormField(
                initialValue: _initValue['email'],
                decoration: InputDecoration(labelText: 'E-mail : '),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
                onSaved: (value) {
                  newBenevole = Benevole(
                    id: newBenevole.id,
                    name: newBenevole.name,
                    number: newBenevole.number,
                    email: value,
                    adresse: newBenevole.adresse,
                    profession: newBenevole.profession,
                    availability: newBenevole.availability,
                  );
                },
              ),
              TextFormField(
                initialValue: _initValue['adresse'],
                decoration: InputDecoration(labelText: 'Adresse : '),
                textInputAction: TextInputAction.next,
                onSaved: (value) {
                  newBenevole = Benevole(
                    id: newBenevole.id,
                    name: newBenevole.name,
                    number: newBenevole.number,
                    email: newBenevole.email,
                    adresse: value,
                    profession: newBenevole.profession,
                    availability: newBenevole.availability,
                  );
                },
              ),
              TextFormField(
                initialValue: _initValue['profession'],
                decoration: InputDecoration(labelText: 'Profession : '),
                textInputAction: TextInputAction.next,
                onSaved: (value) {
                  newBenevole = Benevole(
                    id: newBenevole.id,
                    name: newBenevole.name,
                    number: newBenevole.number,
                    email: newBenevole.email,
                    adresse: newBenevole.adresse,
                    profession: value,
                    availability: newBenevole.availability,
                  );
                },
              ),
              TextFormField(
                initialValue: _initValue['availability'],
                decoration: InputDecoration(
                    labelText: 'Disponibilité : ',
                    hintText: 'Lundi, mardi, ...',
                    hintStyle: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 12,
                        color: Colors.grey.withOpacity(0.5))),
                textInputAction: TextInputAction.done,
                onFieldSubmitted: (_) {
                  _saveForm();

                  Provider.of<BenevoleNotifier>(context, listen: false)
                      .editExisting(args, newBenevole);

                  // Navigator.of(context).pop();
                },
                onSaved: (value) {
                  newBenevole = Benevole(
                    id: (args == null) ? newBenevole.id : _initValue['id'],
                    name: newBenevole.name,
                    number: newBenevole.number,
                    email: newBenevole.email,
                    adresse: newBenevole.adresse,
                    profession: newBenevole.profession,
                    availability: value,
                  );
                },
              ),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                onPressed: () {
                  _saveForm();

                  Provider.of<BenevoleNotifier>(context, listen: false)
                      .editExisting(args, newBenevole);

                  // Navigator.of(context).pop();
                },
                child: Text('Enregistrer'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
