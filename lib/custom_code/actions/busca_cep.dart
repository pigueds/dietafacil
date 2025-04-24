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

Future<String> buscaCep(String cep) async {
  // Formata o CEP para remover traços e espaços
  cep = cep.replaceAll('-', '').replaceAll(' ', '');

  // Verifica se o CEP tem 8 dígitos
  if (cep.length != 8) {
    throw Exception('CEP inválido. O CEP deve ter 8 dígitos.');
  }

  // URL da API ViaCEP
  final url = 'https://viacep.com.br/ws/$cep/json/';

  try {
    // Faz a requisição HTTP
    final response = await http.get(Uri.parse(url));

    // Verifica se a requisição foi bem-sucedida
    if (response.statusCode == 200) {
      // Decodifica o JSON da resposta
      final Map<String, dynamic> data = json.decode(response.body);

      // Verifica se o CEP foi encontrado
      if (data.containsKey('erro')) {
        throw Exception('CEP não encontrado.');
      }

      // Concatena o endereço completo em uma única string
      String rua = data['logradouro'] ?? '';
      String cidade = data['localidade'] ?? '';
      String estado = data['uf'] ?? '';
      String endereco = '$rua, $cidade - $estado';

      // Retorna o endereço completo
      return endereco;
    } else {
      throw Exception('Erro ao buscar o CEP. Tente novamente.');
    }
  } catch (e) {
    throw Exception('Erro: $e');
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
