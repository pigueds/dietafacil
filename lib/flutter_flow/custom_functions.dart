import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

String? cleanCardNumber(String cardNumber) {
// Remove todos os caracteres que não são números
  return cardNumber.replaceAll(RegExp(r'[^0-9]'), '');
}

String? bandeiraCartao(String cleanedCardNumber) {
  // Expressões regulares para cada bandeira
  final RegExp visaRegex = RegExp(r'^4');
  final RegExp mastercardRegex = RegExp(
      r'^(5[1-5]|222[1-9]|22[3-9][0-9]|2[3-6][0-9]{2}|27[01][0-9]|2720)');
  final RegExp amexRegex = RegExp(r'^3[47]');
  final RegExp eloRegex = RegExp(
      r'^(401178|431274|438935|451416|457393|457631|457632|504175|506699|5067[0-9]{2}|5090[0-9]{2}|627780|636297|636368|65003[1-3]|6500[4-5][0-9]|6504[0-9]{2}|6505[0-9]{2}|6507[0-2][0-9]|6507[3-8][0-9]|6509[0-2][0-9]|6509[3-8][0-9]|6516[5-9][0-9]|6550[0-1][0-9]|6550[2-9][0-9]|655021|65505[7-9])');

  // Verifica a bandeira do cartão
  if (visaRegex.hasMatch(cleanedCardNumber)) {
    return 'Visa';
  } else if (mastercardRegex.hasMatch(cleanedCardNumber)) {
    return 'MasterCard';
  } else if (amexRegex.hasMatch(cleanedCardNumber)) {
    return 'American Express';
  } else if (eloRegex.hasMatch(cleanedCardNumber)) {
    return 'Elo';
  } else {
    return 'Desconhecido';
  }
}

String? diasDieta(DateTime? dataDIETA) {
  if (dataDIETA == null) return "Data não disponível";

  final dias = DateTime.now().difference(dataDIETA).inDays;
  return "$dias ${dias == 1 ? 'dia' : 'dias'}";
}

String extractDDD(String phoneNumber) {
  if (phoneNumber == null ||
      !phoneNumber.startsWith('(') ||
      !phoneNumber.contains(')')) {
    return '';
  }
  return phoneNumber.substring(1, 3);
}

String extractPHONE(String phoneNumber) {
// @flutterflow

  if (phoneNumber == null || !phoneNumber.contains(')')) {
    return '';
  }
  final start = phoneNumber.indexOf(')') + 1;
  return phoneNumber.substring(start).replaceAll('-', '');
}

bool? horarioDeepSeek() {
  final agora = DateTime.now().toUtc();
  final hora = agora.hour;
  final minuto = agora.minute;

  final minutosAtual = hora * 60 + minuto;

  final inicio = 16 * 60 + 30; // 16:30 = 990
  final fim = 23 * 60 + 59; // 23:59 = 1439

  return minutosAtual >= inicio && minutosAtual <= fim;
}

String? convertList(String? lista) {
  // Begin custom function
  if (lista == null || lista.isEmpty) {
    return '';
  }

  // Se a entrada for uma String simples (não uma lista), retorne-a diretamente
  return lista;

// End custom function
}
