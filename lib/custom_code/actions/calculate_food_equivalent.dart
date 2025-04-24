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

double calculateFoodEquivalent(
    String food1Name, double quantity, String food2Name) {
  const Map<String, double> foodCarbs = {
    "Arroz branco cozido": 28.0,
    "Arroz integral cozido": 23.0,
    "Feijão preto cozido": 14.0,
    "Feijão carioca cozido": 15.0,
    "Batata-doce cozida": 20.0,
    "Mandioca cozida": 30.0,
    "Macarrão cozido": 25.0,
    "Pão francês": 50.0,
    "Pão integral": 12.0,
    "Cuscuz": 25.0,
    "Quinoa cozida": 21.0,
    "Aveia em flocos": 58.0,
    "Banana": 23.0,
    "Maçã": 14.0,
    "Lentilha cozida": 20.0,
    "Grão-de-bico cozido": 27.0,
    "Milho cozido": 21.0,
    "Tapioca": 85.0,
    "Inhame cozido": 24.0,
    "Abóbora cozida": 6.0,
    "Batata inglesa cozida": 18.0,
    "Pipoca": 78.0,
    "Manga": 15.0,
    "Uva": 16.0,
    "Melancia": 8.0,
    "Melão": 8.0,
    "Pera": 15.0,
    "Goiaba": 14.0,
    "Acerola": 4.0,
    "Caju": 12.0,
    "Pêssego": 10.0,
    "Mamão": 11.0,
    "Morango": 7.0,
    "Kiwi": 15.0,
    "Pinhão cozido": 28.0,
    "Farinha de trigo": 76.0,
    "Farinha de mandioca": 85.0,
    "Farinha de milho": 75.0,
    "Cenoura cozida": 10.0,
    "Beterraba cozida": 10.0,
    "Ervilha cozida": 14.0,
    "Soja cozida": 9.0,
    "Castanha-do-pará": 12.0,
    "Nozes": 14.0,
    "Amêndoas": 22.0,
    "Leite integral": 5.0,
    "Iogurte natural": 4.0,
  };

  if (!foodCarbs.containsKey(food1Name)) {
    throw Exception("Alimento 1 não encontrado na lista!");
  }
  if (!foodCarbs.containsKey(food2Name)) {
    throw Exception("Alimento 2 não encontrado na lista!");
  }

  final carbs1 = foodCarbs[food1Name]!;
  final carbs2 = foodCarbs[food2Name]!;

  return ((carbs1 * quantity) / carbs2).roundToDouble();
}
