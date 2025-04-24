import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'resultado_dieta_sellpage_widget.dart' show ResultadoDietaSellpageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class ResultadoDietaSellpageModel
    extends FlutterFlowModel<ResultadoDietaSellpageWidget> {
  ///  Local state fields for this page.

  double ref1protG = 0.0;

  String mensagemWAIT = 'A melhor dieta é a que você consegue fazer!';

  /// Condicional para mostrar dieta
  bool? dietapronta;

  ///  State fields for stateful widgets in this page.

  // State field(s) for Timer widget.
  final timerInitialTimeMs = 900000;
  int timerMilliseconds = 900000;
  String timerValue = StopWatchTimer.getDisplayTime(
    900000,
    hours: false,
    milliSecond: false,
  );
  FlutterFlowTimerController timerController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countDown));

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    timerController.dispose();
  }
}
