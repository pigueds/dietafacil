import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/info_i_m_c2_widget.dart';
import '/components/menu_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'dados_do_usuario_show_widget.dart' show DadosDoUsuarioShowWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DadosDoUsuarioShowModel
    extends FlutterFlowModel<DadosDoUsuarioShowWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Verifica Assinatura)] action in dados_do_usuario_show widget.
  ApiCallResponse? verificaAssinatura;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
