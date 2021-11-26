// import 'dart:async';

import 'package:flutter/material.dart';

class Benevole {
  final String id;
  final String name;
  final String number;
  final String adresse;
  final String email;
  final String profession;
  final String availability;

  Benevole({
    this.id,
    this.name,
    this.number,
    this.adresse,
    this.email,
    this.profession,
    this.availability,
  });
}

class BenevoleNotifier with ChangeNotifier {
  List benevoles = [
    Benevole(
      id: 'b1',
      name: 'ANDRIAMALALA Falitiana',
      number: '0347992643',
      email: ' Falitiana37@gmail.com',
      adresse: 'Soavinimerina Avarandrano',
      profession: 'Environnementaliste GIZ',
      availability: 'Samedi',
    ),
    Benevole(
      id: 'b2',
      name: 'ANDRIANJAKA Nancy',
      number: '0344343882',
      email: 'nancy.andrianjaka@gmail.com',
      adresse: 'Analamahitsy',
      profession: 'Attachée de direction',
      availability: 'Samedi',
    ),
    Benevole(
      id: 'b3',
      name: 'RAZAFIMANANTSOA Hajarivony Rindra',
      number: '0345431170 ',
      email: 'hajarivonyr@gmail.com',
      adresse: 'Itaosy Hopitaly',
      profession: 'Directeur vente, Marketing et Partenariat',
      availability: 'Mercredi',
    ),
    Benevole(
      id: 'b4',
      name: 'RAJAONARIVELO Ranto',
      number: '0347029304',
      email: 'Rantorajaonarivelo521@gmail.com',
      adresse: 'Ambatokaranana',
      profession: 'Etudiant',
      availability: 'Mercredi',
    ),
    Benevole(
      id: 'b5',
      name: 'RAKOTOARIMANANA Anjaharivola Tendrisoa',
      number: '0348208958',
      email: 'rakotoarimananatendrisoa@gmail.com',
      adresse: 'Ambohidrapeto Itaosy',
      profession: 'Etudiante',
      availability: 'Samedi',
    ),
  ];

  addNew(Benevole newBenevole) {
    // benevoles.insert(newBenevole);
    benevoles.add(newBenevole);
    notifyListeners();
  }

  editExisting(String editId, Benevole editBenevole) {
    int index;
    index = benevoles.indexWhere((element) => element.id == editId);
    benevoles[index] = editBenevole;
    notifyListeners();
  }
}
