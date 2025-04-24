import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'info_configavancada_widget.dart' show InfoConfigavancadaWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class InfoConfigavancadaModel
    extends FlutterFlowModel<InfoConfigavancadaWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for SliderProteina widget.
  double? sliderProteinaValue;
  // State field(s) for SliderGordura widget.
  double? sliderGorduraValue;
  // State field(s) for Switch widget.
  bool? switchValue;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
