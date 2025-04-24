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

Future<String> extractYearFromMMYY(String mmYYString) async {
  try {
    // Verifica se a string está no formato correto
    if (mmYYString.length != 5 || mmYYString[2] != '/') {
      throw Exception('Formato inválido. Use MM/AA');
    }

    // Extrai os últimos 2 caracteres como ano
    String year = mmYYString.substring(3, 5);

    // Valida se é um ano válido (qualquer número de 2 dígitos)
    if (int.tryParse(year) == null) {
      throw Exception('Ano inválido');
    }

    return year;
  } catch (e) {
    debugPrint('Erro ao extrair ano: $e');
    return '00'; // Retorno padrão em caso de erro
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
