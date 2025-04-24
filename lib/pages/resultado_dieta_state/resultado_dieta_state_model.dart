import '/components/menu_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'resultado_dieta_state_widget.dart' show ResultadoDietaStateWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ResultadoDietaStateModel
    extends FlutterFlowModel<ResultadoDietaStateWidget> {
  ///  Local state fields for this page.

  String mensagemWAIT = 'A melhor dieta é a que você consegue fazer!';

  /// Condicional para mostrar dieta
  bool? dietapronta;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
