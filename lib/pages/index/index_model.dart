import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/menu_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'index_widget.dart' show IndexWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class IndexModel extends FlutterFlowModel<IndexWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Verifica Assinatura)] action in index widget.
  ApiCallResponse? verificaAssinatura;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
