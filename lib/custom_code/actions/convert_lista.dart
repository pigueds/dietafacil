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

String? convertLista(List<String>? lista) {
  /// MODIFY CODE ONLY BELOW THIS LINE

  if (lista == null || lista.isEmpty) {
    return '';
  }
  return lista.join(', ');

  /// MODIFY CODE ONLY ABOVE THIS LINE
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
