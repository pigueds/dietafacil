import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'dados_do_usuario_cancelar_ass_widget.dart'
    show DadosDoUsuarioCancelarAssWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DadosDoUsuarioCancelarAssModel
    extends FlutterFlowModel<DadosDoUsuarioCancelarAssWidget> {
  ///  Local state fields for this page.

  String? nome;

  String? inicio;

  String? proxpagto;

  String? valor;

  String? cartao;

  String? email;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - API (Verifica Assinatura)] action in dados_do_usuario_cancelar_ass widget.
  ApiCallResponse? verificaAssinatura;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (Cancelar Assinatura)] action in Button widget.
  ApiCallResponse? cancelarAssinatura;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
