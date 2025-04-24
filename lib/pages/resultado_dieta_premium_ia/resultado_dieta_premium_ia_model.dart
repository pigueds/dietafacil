import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/menu_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'resultado_dieta_premium_ia_widget.dart'
    show ResultadoDietaPremiumIaWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class ResultadoDietaPremiumIaModel
    extends FlutterFlowModel<ResultadoDietaPremiumIaWidget> {
  ///  Local state fields for this page.

  String mensagemWAIT = 'A melhor dieta é a que você consegue fazer!';

  /// Condicional para mostrar dieta
  bool? dietapronta;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (DeepSeekDieta)] action in resultado_dieta_premium_ia widget.
  ApiCallResponse? resultadoDieta;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
