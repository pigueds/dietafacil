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

Future<String> extractMonthFromMMYY(String mmYYString) async {
  try {
    // Verifica se a string está no formato correto
    if (mmYYString.length != 5 || mmYYString[2] != '/') {
      throw Exception('Formato inválido. Use MM/AA');
    }

    // Extrai os primeiros 2 caracteres como mês
    String month = mmYYString.substring(0, 2);

    // Valida se é um mês válido (01-12)
    int monthInt = int.tryParse(month) ?? 0;
    if (monthInt < 1 || monthInt > 12) {
      throw Exception('Mês inválido. Deve ser entre 01 e 12');
    }

    return month;
  } catch (e) {
    debugPrint('Erro ao extrair mês: $e');
    return '00'; // Retorno padrão em caso de erro
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
