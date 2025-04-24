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

import 'package:http/http.dart' as http;
import 'dart:convert';

Future<String> buscaCEPbairro(String cep) async {
  cep = cep.replaceAll('-', '').replaceAll(' ', '');

  if (cep.length != 8) {
    throw Exception('CEP inválido. O CEP deve ter 8 dígitos.');
  }

  final url = 'https://viacep.com.br/ws/$cep/json/';

  try {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);

      if (data.containsKey('erro')) {
        throw Exception('CEP não encontrado.');
      }

      return data['bairro'] ?? ''; // Agora retorna o bairro ao invés da cidade
    } else {
      throw Exception('Erro ao buscar o CEP. Tente novamente.');
    }
  } catch (e) {
    throw Exception('Erro: $e');
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
