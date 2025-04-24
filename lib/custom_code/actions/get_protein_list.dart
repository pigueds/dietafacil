// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

List<String> getProteinList() {
  const Map<String, double> foodProteins = {
    "Peito de frango": 31.0,
    "Coxa de frango": 28.0,
    "Filé de peito de frango": 30.0,
    "Carne bovina magra": 26.0,
    "Patinho": 29.0,
    "Alcatra": 27.0,
    "Filé mignon": 26.0,
    "Peixe tilápia": 26.0,
    "Salmão": 25.0,
    "Atum fresco": 29.0,
    "Sardinha": 25.0,
    "Bacalhau": 25.0,
    "Pescada": 19.0,
    "Camarão": 24.0,
    "Ovo inteiro": 6.0,
    "Clara de ovo": 3.6,
    "Peito de peru": 29.0,
    "Lombo suíno": 28.0,
    "Filé de peixe branco": 22.0,
    "Carne moída": 26.0,
    "Costela bovina": 28.0,
    "Lagarto": 30.0,
    "Fígado bovino": 29.0,
    "Coração de frango": 26.0,
    "Peito de pato": 23.0,
    "Carne de cordeiro": 25.0,
    "Polvo": 25.0,
    "Lula": 16.0,
    "Ostras": 9.0,
    "Mexilhão": 20.0,
    "Caranguejo": 19.0,
    "Lagosta": 19.0,
    "Tilápia grelhada": 26.0,
    "Picanha": 26.0,
    "Contrafilé": 29.0,
    "Filé de merluza": 19.0,
    "Filé de truta": 22.0,
    "Filé de pescada": 19.0,
    "Anchova": 20.0,
    "Cavala": 19.0,
    "Dourado": 23.0,
    "Robalo": 24.0,
    "Corvina": 19.0,
    "Tambaqui": 16.0,
    "Pirarucu": 22.0,
    "Carne seca": 26.0,
    "Charque": 30.0,
    "Presunto magro": 18.0,
    "Peito de chester": 29.0,
  };

  return foodProteins.keys.toList();
}
