// import 'dart:async';

import 'package:flutter/material.dart';

class Benevole {
  final String name;
  final String number;
  final String adresse;
  final String email;
  final String profession;
  final String availability;

  Benevole({
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
      name: 'ANDRIAMALALA Falitiana',
      number: '0347992643',
      email: ' Falitiana37@gmail.com',
      adresse: 'Soavinimerina Avarandrano',
      profession: 'Environnementaliste GIZ',
      availability: 'Samedi',
    ),
    Benevole(
      name: 'ANDRIANJAKA Nancy',
      number: '0344343882',
      email: 'nancy.andrianjaka@gmail.com',
      adresse: 'Analamahitsy',
      profession: 'Attachée de direction',
      availability: 'Samedi',
    ),
    Benevole(
      name: 'RAZAFIMANANTSOA Hajarivony Rindra',
      number: '0345431170 ',
      email: 'hajarivonyr@gmail.com',
      adresse: 'Itaosy Hopitaly',
      profession: 'Directeur vente, Marketing et Partenariat',
      availability: 'Mercredi',
    ),
    Benevole(
      name: 'RAJAONARIVELO Ranto',
      number: '0347029304',
      email: 'Rantorajaonarivelo521@gmail.com',
      adresse: 'Ambatokaranana',
      profession: 'Etudiant',
      availability: 'Mercredi',
    ),
    Benevole(
      name: 'RAKOTOARIMANANA Anjaharivola Tendrisoa',
      number: '0348208958',
      email: 'rakotoarimananatendrisoa@gmail.com',
      adresse: 'Ambohidrapeto Itaosy',
      profession: 'Etudiante',
      availability: 'Samedi',
    ),
  ];
}
