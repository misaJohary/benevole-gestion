import 'package:benevolat/provider/benevole.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddNewBenevole extends StatefulWidget {
  static String routeName = './add-new';

  @override
  _AddNewBenevoleState createState() => _AddNewBenevoleState();
}

class _AddNewBenevoleState extends State<AddNewBenevole> {
  final _form = GlobalKey<FormState>();
  Benevole newBenevole = Benevole(
    id: DateTime.now().toString(),
    name: '',
    number: '',
    email: '',
    adresse: '',
    profession: '',
    availability: '',
  );

  _saveForm() {
    _form.currentState.save();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajouter un nouveau membre'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _form,
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Nom et Prénom : '),
                textInputAction: TextInputAction.next,
                onSaved: (value) {
                  newBenevole = Benevole(
                    id: newBenevole.id,
                    name: value,
                    number: newBenevole.number,
                    email: newBenevole.number,
                    adresse: newBenevole.adresse,
                    profession: newBenevole.profession,
                    availability: newBenevole.availability,
                  );
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Contact : '),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.phone,
                onSaved: (value) {
                  newBenevole = Benevole(
                    id: newBenevole.id,
                    name: newBenevole.name,
                    number: value,
                    email: newBenevole.number,
                    adresse: newBenevole.adresse,
                    profession: newBenevole.profession,
                    availability: newBenevole.availability,
                  );
                },
              ),
              TextFormField(
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
                decoration: InputDecoration(labelText: 'Adresse : '),
                textInputAction: TextInputAction.next,
                onSaved: (value) {
                  newBenevole = Benevole(
                    id: newBenevole.id,
                    name: newBenevole.name,
                    number: newBenevole.number,
                    email: newBenevole.number,
                    adresse: value,
                    profession: newBenevole.profession,
                    availability: newBenevole.availability,
                  );
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Profession : '),
                textInputAction: TextInputAction.next,
                onSaved: (value) {
                  newBenevole = Benevole(
                    id: newBenevole.id,
                    name: newBenevole.name,
                    number: newBenevole.number,
                    email: newBenevole.number,
                    adresse: newBenevole.adresse,
                    profession: value,
                    availability: newBenevole.availability,
                  );
                },
              ),
              TextFormField(
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
                  Provider.of<BenevoleNotifier>(context,  listen: false).addNew(newBenevole);
                  // Navigator.of(context).pop();
                },
                onSaved: (value) {
                  newBenevole = Benevole(
                    id: newBenevole.id,
                    name: newBenevole.name,
                    number: newBenevole.number,
                    email: newBenevole.number,
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
                  Provider.of<BenevoleNotifier>(context, listen: false).addNew(newBenevole);
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
